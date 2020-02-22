# frozen_string_literal: true

class AddImageToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :image, :string
  end
end
