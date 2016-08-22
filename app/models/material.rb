class Material < ActiveRecord::Base

	# ASSOCIATIONS
	has_and_belongs_to_many :courses
	accepts_nested_attributes_for :courses
	
	# VALIDATIONS
	validates :name,
	presence: true,
	length: { minimum: 5 }
	
	validates :file_path,
	presence: true,
	length: { minimum: 5 }


end
