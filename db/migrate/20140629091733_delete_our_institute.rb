class DeleteOurInstitute < ActiveRecord::Migration
  def change
  	drop_table :our_institutes
  end
end
