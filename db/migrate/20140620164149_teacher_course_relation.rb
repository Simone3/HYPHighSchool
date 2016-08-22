class TeacherCourseRelation < ActiveRecord::Migration
  def change

  	add_column(:courses, :teacher_id, :integer)
  	add_column(:courses, :grade, :integer)
  	add_column(:courses, :program, :text)

  end
end
