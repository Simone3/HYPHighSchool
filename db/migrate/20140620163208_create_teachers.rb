class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.text :last_name

      t.timestamps
    end
  end
end
