class Discussion < ApplicationRecord
  # mount_uploader :image, ImageUploader
  has_one_attached :image
  has_rich_text :content

  belongs_to :channel
  belongs_to :user
  has_many :replies, dependent: :destroy

  validates :title, :content, presence: true
  resourcify

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    title_changed?
  end

  
  
end
