# frozen_string_literal: true

class AddSerialIdToScenes < ActiveRecord::Migration[5.2]
  def change
    add_column :scenes, :user_id, :integer
  end
end
