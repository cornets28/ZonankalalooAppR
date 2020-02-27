class AddViewToScenes < ActiveRecord::Migration[5.2]
  def change
    add_column :scenes, :view, :integer
  end
end
