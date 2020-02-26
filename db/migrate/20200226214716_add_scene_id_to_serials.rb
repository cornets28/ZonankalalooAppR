class AddSceneIdToSerials < ActiveRecord::Migration[5.2]
  def change
    add_column :serials, :user_id, :integer
  end
end
