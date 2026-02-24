class Post < ApplicationRecord
  belongs_to :user
  belongs_to :source, polymorphic: true, optional: true
  
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum :status, { public_post: 0, private_post: 1, draft: 2 }, default: :draft
  enum :source_type_enum, { web_page: 0, book: 1, others: 2 }, default: :web_page

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 10000 }
  validates :status, presence: true
  validates :source_type_enum, presence: true

  scope :published, -> { where(status: :public_post) }

  attr_reader :source_attributes

  before_validation :assign_source_from_attributes

  def source_attributes=(attributes)
    @source_attributes = attributes
  end

  def web_page?
    source_type_enum == "web_page"
  end

  def book?
    source_type_enum == "book"
  end

  private

  def assign_source_from_attributes
    return if @source_attributes.blank? || @source_attributes.values.all?(&:blank?)

    if web_page? && @source_attributes[:url].present?
      self.source = WebPageMetadatum.find_or_initialize_by(url: @source_attributes[:url])
    elsif book? && @source_attributes[:title].present?
      self.source = BookMetadatum.new(title: @source_attributes[:title], author: @source_attributes[:author])
    end
  end
end
