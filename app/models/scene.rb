# frozen_string_literal: true

class Scene < ApplicationRecord
  has_one_attached :image

  has_rich_text :content

  belongs_to :serial
  belongs_to :user
  has_many :replies, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :content, length: { maximum: 150, minimum: 10 }, presence: true

  validates :title, length: { minimum: 15 }, presence: true
  resourcify

  extend FriendlyId
  friendly_id :title, use: %i[slugged finders]

  self.per_page = 5
  def should_generate_new_friendly_id?
    title_changed?
  end
end
