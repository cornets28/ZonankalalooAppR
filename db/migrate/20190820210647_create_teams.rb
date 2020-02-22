# frozen_string_literal: true

class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :firstname
      t.string :lastname
      t.string :position
      t.string :facebook_link
      t.string :twitter_link
      t.string :email

      t.timestamps
    end
  end
end
