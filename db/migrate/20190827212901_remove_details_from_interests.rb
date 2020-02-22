# frozen_string_literal: true

class RemoveDetailsFromInterests < ActiveRecord::Migration[5.2]
  def change
    remove_column :interests, :details, :string
  end
end
