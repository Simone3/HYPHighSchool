class NewsController < ApplicationController

	# All news, ordered by date
	def index
		@all_news = News.order("publication_date DESC").all
	end

	# Show news content + 2 GT links "next" and "previous"
	def show

		@news = News.find(params[:id])

		@next = News.where("publication_date <= ? AND id != ?", @news.publication_date, @news.id).order("publication_date DESC").first;
		@previous = News.where("publication_date >= ? AND id != ?", @news.publication_date, @news.id).order("publication_date DESC").last;

	end

end
