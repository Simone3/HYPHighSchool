class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.text :books
      t.integer :structure_id

      t.timestamps
    end
  end
end
