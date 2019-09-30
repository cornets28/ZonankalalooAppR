class Discussion < ApplicationRecord
  
  has_one_attached :image
  
  has_rich_text :content

  belongs_to :channel
  belongs_to :user
  has_many :replies, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :content, length: { maximum: 15000, minimum: 100 }, presence: true

  validates :title, length: { minimum: 30 }, presence: true
  resourcify

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  
  self.per_page = 5
  def should_generate_new_friendly_id?
    title_changed?
  end
  
end
