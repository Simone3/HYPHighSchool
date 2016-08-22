class MaterialsController < ApplicationController

	##### INDEX #####

	# All teaching material ordered by name
	def index

		@materials = Material.order("name ASC").all.group_by{|m| m.name[0]}

	end


	##### SHOW #####

	def show

		@material = Material.find(params[:id])

		@related_courses = @material.courses

	end

	# Activates the file download
	def download

		@material = Material.find(params[:id])

		send_data "", :filename => "/assets/data/"+@material.file_path

	end


	##### CREATE/EDIT #####

	def new
		@material = Material.new()
		@courses = Course.order("name ASC").all
	end

  	def create
		
		@material = Material.new(material_params)  
		@courses = Course.order("name ASC").all

		# Try to save file in db
		if @material.save
			redirect_to @material
		else
			render 'new'
		end

	end

	def edit
		@material = Material.find(params[:id])
		@courses = Course.order("name ASC").all
		
	end

	def update
		
		@material = Material.find(params[:id])
		@courses = Course.order("name ASC").all

		# Try to save file in db
		if @material.update(material_params)
			redirect_to @material
		else
			render 'edit'
		end
	end

	# Allowed parameters in new/edit
	private def material_params
		params.require(:material).permit(:name, :description, :file_path, :course_ids => []) 
	end

end
