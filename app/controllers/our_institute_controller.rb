class OurInstituteController < ApplicationController

	# Set up the "All-to-All" pattern links for the institute pages
	extend ActionDispatch::Routing::UrlFor
	before_filter :get_all_to_all_links, :only => [:general_description, :awards, :history, :photogallery, :how_to_get_here]
	protected def get_all_to_all_links
		@all_to_all_links = [ ]
		@all_to_all_links << [ "General Description", url_for(:controller => 'our_institute', :action => 'general_description', :only_path => true) ]
		@all_to_all_links << [ "How to get here", url_for(:controller => 'our_institute', :action => 'how_to_get_here', :only_path => true) ]
		@all_to_all_links << [ "Awards and national tests", url_for(:controller => 'our_institute', :action => 'awards', :only_path => true) ]
		@all_to_all_links << [ "History and tradition", url_for(:controller => 'our_institute', :action => 'history', :only_path => true) ]
		@all_to_all_links << [ "Photogallery", url_for(:controller => 'our_institute', :action => 'photogallery', :only_path => true) ]
	end	



	# Empty methods (all static pages)
	# I choose this solution (instead of putting all pages in the db and then just retrieve one in "show" method with the ID) because gives more freedom with page layout (eg. image positioning)

	def general_description
	end
	
	def awards
	end

	def history
	end

	def photogallery
	end

	def how_to_get_here
	end
end
