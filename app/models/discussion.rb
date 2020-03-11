# frozen_string_literal: true

class Discussion < ApplicationRecord
  has_one_attached :image

  has_rich_text :content

  belongs_to :channel
  belongs_to :user
  has_many :replies, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :content, length: { maximum: 15_000, minimum: 100 }, presence: true

  validate :channel_existing

  private

  def channel_existing
    errors.add(:channel_id, :missing) if channel.blank?
  end

  # def check_if_present
  #   errors.add(:base, 'vous devez inserer un image') if image.blank?
  # end

  #   def check_if_present
  #     errors.add(:base, 'tel must be present!') if image.blank?
  #  end

  validates :title, length: { maximun: 35, minimum: 30, too_short: 'Le titre doit avoir 30 Characters min et 100 characters max', too_long: 'trop long' }, presence: true
  resourcify

  extend FriendlyId
  friendly_id :title, use: %i[slugged finders]

  self.per_page = 5

  def should_generate_new_friendly_id?
    title_changed?
  end
end
