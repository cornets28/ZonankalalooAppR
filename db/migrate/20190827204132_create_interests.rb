# frozen_string_literal: true

class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.string :details
      t.string :title
      t.string :image
      t.string :shortdescription

      t.timestamps
    end
  end
end
