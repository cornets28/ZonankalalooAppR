class AddImageToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :image, :string
  end
end
