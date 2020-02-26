class CreateScenes < ActiveRecord::Migration[5.2]
  def change
    create_table :scenes do |t|
      t.string :title
      t.text :content
      t.string :image
      t.string :serial_id

      t.timestamps
    end
  end
end
