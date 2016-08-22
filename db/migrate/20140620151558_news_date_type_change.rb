class NewsDateTypeChange < ActiveRecord::Migration
  def change

  	 change_column :news, :publication_date, :datetime

  end
end
