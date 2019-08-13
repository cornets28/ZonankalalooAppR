class CreatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |t|
      t.string :image
      t.string :official_link
      t.string :company_name

      t.timestamps
    end
  end
end
