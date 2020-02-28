# frozen_string_literal: true

class AddSlugToScenes < ActiveRecord::Migration[5.2]
  def change
    add_column :scenes, :slug, :string
  end
end
