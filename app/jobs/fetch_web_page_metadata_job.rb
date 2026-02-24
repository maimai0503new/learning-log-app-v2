class FetchWebPageMetadataJob < ApplicationJob
  queue_as :default

  def perform(metadata_id)
    metadata = WebPageMetadatum.find_by(id: metadata_id)
    return unless metadata && metadata.url.present?

    ogp = Services::OgpService.fetch(metadata.url)
    if ogp
      metadata.update!(
        title: ogp[:title],
        description: ogp[:description],
        image_url: ogp[:image_url]
      )
    end
  end
end
