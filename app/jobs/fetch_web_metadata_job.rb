class FetchWebMetadataJob < ApplicationJob
  queue_as :default

  def perform(metadata_id)
    metadata = WebPageMetadatum.find_by(id: metadata_id)
    return unless metadata

    page = MetaInspector.new(metadata.url)
    metadata.update!(
      title: page.title,
      description: page.description,
      image_url: page.images.best
    )

    # Broadcast update if the post exists
    if metadata.post
      metadata.post.broadcast_replace_to(
        "post_#{metadata.post.id}",
        target: "web_preview_#{metadata.id}",
        partial: "posts/web_preview",
        locals: { metadata: metadata }
      )
    end
  rescue => e
    Rails.logger.error "FetchWebMetadataJob Error: #{e.message}"
  end
end
