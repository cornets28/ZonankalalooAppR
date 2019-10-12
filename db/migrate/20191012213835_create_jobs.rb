class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :job_title
      t.string :position
      t.string :description
      t.date :opening_date
      t.date :closingdate
      t.string :location

      t.timestamps
    end
  end
end
