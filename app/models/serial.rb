# frozen_string_literal: true

class Serial < ApplicationRecord
  has_many :scenes
  has_many :users, through: :scenes
  resourcify

  extend FriendlyId
  friendly_id :serial, use: %i[slugged finders]
  self.per_page = 9

  def should_generate_new_friendly_id?
    serial_changed?
  end
end
