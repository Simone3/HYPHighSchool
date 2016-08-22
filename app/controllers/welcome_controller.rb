class WelcomeController < ApplicationController

	# The home page: all static content, barring the 3 most recent news retrieved in this method
	def index
	
		@news = News.order("publication_date DESC").limit(3).all

	end

end
