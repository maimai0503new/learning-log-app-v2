class FetchBookMetadataJob < ApplicationJob
  queue_as :default

  def perform(metadata_id)
    metadata = BookMetadatum.find_by(id: metadata_id)
    return unless metadata

    # Simplified search using Google Books API (no key needed for basic search)
    url = "https://www.googleapis.com/books/v1/volumes?q=intitle:#{CGI.escape(metadata.title)}"
    response = Net::HTTP.get(URI(url))
    data = JSON.parse(response)

    if data["items"] && data["items"].any?
      item = data["items"].first["volumeInfo"]
      metadata.update!(
        author: item["authors"]&.join(", "),
        ndc_label: item["categories"]&.join(", ") # simplified for ndc
      )
    end

    if metadata.post
      metadata.post.broadcast_replace_to(
        "post_#{metadata.post.id}",
        target: "book_preview_#{metadata.id}",
        partial: "posts/book_preview",
        locals: { metadata: metadata }
      )
    end
  rescue => e
    Rails.logger.error "FetchBookMetadataJob Error: #{e.message}"
  end
end
