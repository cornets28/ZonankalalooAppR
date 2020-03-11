# frozen_string_literal: true

class Serial < ApplicationRecord
  has_one_attached :image
  has_many :scenes
  belongs_to :user
  resourcify
  validate :valid_image

  extend FriendlyId
  friendly_id :mainTitle, use: %i[slugged finders]
  validates :mainTitle, length: { minimum: 5, maximum: 20, too_short: 'Le titre doit avoir 5 Characters min et 20 characters max' }, presence: true

  def should_generate_new_friendly_id?
    mainTitle_changed?
  end

  private

  def valid_image
    if image.attached? && !image.content_type.in?(%w[image/jpeg image/jpgimage/png image/gif])
      errors.add(:image, 'must be a JPEG or PNG')
    end
  end
end
