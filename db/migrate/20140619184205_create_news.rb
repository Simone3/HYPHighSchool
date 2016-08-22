class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.date :pubblication_date

      t.timestamps
    end
  end
end
