class BookMetadatum < ApplicationRecord
  has_one :post, as: :source, dependent: :destroy
  validates :title, presence: true

  after_create_commit :fetch_metadata_later

  private

  def fetch_metadata_later
    FetchBookMetadataJob.perform_later(self.id)
  end
end
