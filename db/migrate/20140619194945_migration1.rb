class Migration1 < ActiveRecord::Migration
  def change

  		rename_column(:news, :pubblication_date, :publication_date)

  end
end
