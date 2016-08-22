class CreateOurInstitutes < ActiveRecord::Migration
  def change
    create_table :our_institutes do |t|
      t.string :page_title
      t.text :page_content

      t.timestamps
    end
  end
end
