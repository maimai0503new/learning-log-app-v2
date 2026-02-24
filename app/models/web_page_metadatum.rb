class WebPageMetadatum < ApplicationRecord
  has_one :post, as: :source, dependent: :destroy
  validates :url, presence: true, uniqueness: true

  after_create_commit :fetch_metadata_later

  private

  def fetch_metadata_later
    FetchWebPageMetadataJob.perform_later(self.id)
  end
end
