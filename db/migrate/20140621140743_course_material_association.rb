class CourseMaterialAssociation < ActiveRecord::Migration

	def self.up
		create_table :courses_materials, :id => false do |t|
		t.references :course
		t.references :material
	end

		add_index :courses_materials, [:course_id, :material_id]

	end

end
