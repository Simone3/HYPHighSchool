Rails.application.routes.draw do

	root 'welcome#index'


	###### COURSES ######
	get 'courses/new', to: 'courses#new', as: 'new_course'
	get 'courses/:id/edit', to: 'courses#edit', as: 'edit_course'
	get 'courses', to: 'courses#index', as: 'courses'
	post 'courses', to: 'courses#create'
	get 'courses/:id', to: 'courses#show', as: 'course'
	patch 'courses/:id', to: 'courses#update'
	get 'courses/:id/books', to: 'courses#showBooks', as: 'courseBooks'
	get 'courses/:id/program', to: 'courses#showProgram', as: 'courseProgram'
	get 'courses/:id/material', to: 'courses#showMaterial', as: 'courseMaterial'
	get 'departments/courses', to: 'courses#indexDepartments', as: 'coursesDepartments'
	get 'departments/:dep/courses', to: 'courses#indexByDepartment', as: 'coursesByDepartment'
	get 'grades/courses', to: 'courses#indexGrades', as: 'coursesGrades'
	get 'grades/:gra/courses', to: 'courses#indexByGrade', as: 'coursesByGrade'


	###### NEWS ######
	get 'news', to: 'news#index', as: 'all_news'
	get 'news/:id', to: 'news#show', as: 'news'


	###### OUR INSTITUTE ######
	get 'our_institute', to: 'our_institute#general_description', as: 'our_institute_main'
	get 'our_institute/awards', to: 'our_institute#awards', as: 'our_institute_awards'
	get 'our_institute/history', to: 'our_institute#history', as: 'our_institute_history'
	get 'our_institute/photogallery', to: 'our_institute#photogallery', as: 'our_institute_photogallery'
	get 'our_institute/how_to_get_here', to: 'our_institute#how_to_get_here', as: 'our_institute_how_to_get_here'

	###### MATERIAL ######
	get 'material/new', to: 'materials#new', as: 'new_material'
	get 'material/:id/edit', to: 'materials#edit', as: 'edit_material'
	get 'material', to: 'materials#index', as: 'materials'
	post 'material', to: 'materials#create', as: 'create_material'
	get 'material/:id', to: 'materials#show', as: 'material'
	patch 'material/:id', to: 'materials#update'
	get 'material/download/:id', to: 'materials#download', as: 'material_download'


	###### ADMIN ######
	get 'administration', to: 'administration#index', as: 'administration'


end
