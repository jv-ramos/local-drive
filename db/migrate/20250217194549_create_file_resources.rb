class CreateFileResources < ActiveRecord::Migration[8.0]
  def change
    create_table :file_resources do |t|
      t.string :name

      t.timestamps
    end
  end
end
