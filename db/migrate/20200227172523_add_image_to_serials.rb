class AddImageToSerials < ActiveRecord::Migration[5.2]
  def change
    add_column :serials, :image, :string
  end
end
