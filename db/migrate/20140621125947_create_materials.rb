class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.text :description
      t.string :file_path

      t.timestamps
    end
  end
end
