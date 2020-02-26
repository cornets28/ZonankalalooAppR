# frozen_string_literal: true

class Serial < ApplicationRecord
  has_many :scenes
  has_many :users, through: :scenes
  resourcify

  extend FriendlyId
  friendly_id :mainTitle, use: %i[slugged finders]
  validates :mainTitle, length: { minimum: 15 }, presence: true
  self.per_page = 3

  def should_generate_new_friendly_id?
    mainTitle_changed?
  end
end
