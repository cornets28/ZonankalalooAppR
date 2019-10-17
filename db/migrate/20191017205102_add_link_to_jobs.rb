class AddLinkToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :link, :string
  end
end
