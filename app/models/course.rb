class Course < ActiveRecord::Base

	# ASSOCIATIONS
	belongs_to :teacher
	belongs_to :department
	has_and_belongs_to_many :materials
	belongs_to :structure

	# VALIDATIONS
	validates :name,
	presence: true,
	length: { minimum: 5 }
	
	validates :structure_id,
	presence: true

	validates :teacher_id,
	presence: true

	validates :grade,
	presence: true
	validates_inclusion_of :grade, :in => [9, 10, 11, 12], :allow_nil => false

	validates :department_id,
	presence: true
	
	validates :classroom,
	presence: true,
	length: { minimum: 1 }

end
