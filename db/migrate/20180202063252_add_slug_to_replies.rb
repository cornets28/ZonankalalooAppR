# frozen_string_literal: true

class AddSlugToReplies < ActiveRecord::Migration[5.1]
  def change
    add_column :replies, :slug, :string
  end
end
