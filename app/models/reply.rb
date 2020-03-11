# frozen_string_literal: true

class Reply < ApplicationRecord
  has_rich_text :reply
  belongs_to :discussion
  belongs_to :user
  validates :reply, length: { maximum: 500 }, presence: true

  extend FriendlyId
  friendly_id :reply, use: %i[slugged finders]

  def should_generate_new_friendly_id?
    reply_changed?
  end
end
