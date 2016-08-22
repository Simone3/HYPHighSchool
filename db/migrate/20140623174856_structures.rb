class Structures < ActiveRecord::Migration
  def change
    create_table :structures do |t|
      t.string :name

      t.timestamps
    end

    add_column(:courses, :classroom, :string)
  end
end
