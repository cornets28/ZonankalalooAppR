class Channel < ApplicationRecord
  # has_rich_text :content

  has_many :discussions
  has_many :users, through: :discussions
  resourcify

  extend FriendlyId
  friendly_id :channel, use: [:slugged, :finders]
  self.per_page = 9

  def should_generate_new_friendly_id?
    channel_changed?
  end

end
