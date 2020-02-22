# frozen_string_literal: true

class AddViewToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :view, :integer
  end
end
