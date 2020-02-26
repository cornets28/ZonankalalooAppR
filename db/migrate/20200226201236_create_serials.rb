class CreateSerials < ActiveRecord::Migration[5.2]
  def change
    create_table :serials do |t|
      t.string :mainTitle

      t.timestamps
    end
  end
end
