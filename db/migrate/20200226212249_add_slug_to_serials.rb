# frozen_string_literal: true

class AddSlugToSerials < ActiveRecord::Migration[5.2]
  def change
    add_column :serials, :slug, :string
  end
end
