class CoursesController < ApplicationController
	
	# Set up the "All-to-All" pattern links for the course pages
	extend ActionDispatch::Routing::UrlFor
	before_filter :get_all_to_all_links, :only => [:show, :showBooks, :showProgram, :showMaterial]
	protected def get_all_to_all_links
		@all_to_all_links = [ ]
		@all_to_all_links << [ "General Description", url_for(:controller => 'courses', :action => 'show', :only_path => true) ]
		@all_to_all_links << [ "Books", url_for(:controller => 'courses', :action => 'showBooks', :only_path => true) ]
		@all_to_all_links << [ "Program", url_for(:controller => 'courses', :action => 'showProgram', :only_path => true) ]
		@all_to_all_links << [ "Teaching Material", url_for(:controller => 'courses', :action => 'showMaterial', :only_path => true) ]
		@all_to_all_links << [ "Tests", "#", "inactive_link" ]
		@all_to_all_links << [ "Classes", "#", "inactive_link" ]
	end


	##### INDEXES #####

	# Main course index, with all courses ordered by name
	def index
		@extra_name = ""
		@description = "HYP School offers a huge variety of courses to prepare the students in all possible subjects.<br><br>Our curriculum offers the following courses, ordered alphabetically:";
		@courses = Course.order("name").all.group_by{|c| c.name[0]}
	end

	# Select a grade to narrow the course search
	def indexGrades
		@grades = [9, 10, 11, 12]
	end

	# All courses of a specific grade, ordered by name
	def indexByGrade
		@extra_name = " "+params[:gra].to_i.ordinalize+" grade"
		@description = "HYP School's "+params[:gra].to_i.ordinalize+" grade students can follow these courses, ordered alphabetically:";
		@courses = Course.where("grade = ?", params[:gra]).order("name").all.group_by{|c| c.name[0]}
		render 'index'
	end

	# Select a department to narrow the course search
	def indexDepartments
		department_ids = Course.select("distinct department_id").all
		@departments = Department.where("id IN (?)", department_ids).all
	end

	# All courses of a specific department, ordered by name
	def indexByDepartment
		@extra_name = " "+Department.find(params[:dep]).name
		@description = "HYP School's "+Department.find(params[:dep]).name+" department offers these courses, ordered alphabetically:";
		@courses = Course.where("department_id = ?", params[:dep]).order("name").all.group_by{|c| c.name[0]}
		render 'index'
	end	


	##### SHOW #####

	def show

		@course = Course.find(params[:id])
		teacher = @course.teacher
		@teacher_name = teacher.first_name + " " + teacher.last_name
		@department = @course.department
		@structure = @course.structure
		
	end
	
	def showBooks
		@course = Course.find(params[:id])
	end
	
	def showProgram
		@course = Course.find(params[:id])
	end

	def showMaterial

		@course = Course.find(params[:id])
		@materials = @course.materials.order("updated_at")

	end


	##### CREATE/EDIT #####

	def new
		@course = Course.new()
	end

  	def create
		
		@course = Course.new(course_params)  
		
		# Try to save course in db
		if @course.save
			redirect_to @course
		else
			render 'new'
		end

	end

	def edit
		@course = Course.find(params[:id])
	end

	def update
		
		@course = Course.find(params[:id])
		
		# Try to save course in db
		if @course.update(course_params)
			redirect_to @course
		else
			render 'edit'
		end
	end

	# Allowed course parameters in new/edit
	private def course_params
		params.require(:course).permit(:name, :structure_id, :teacher_id, :grade, :department_id, :classroom, :description, :books, :program) 
	end

end
