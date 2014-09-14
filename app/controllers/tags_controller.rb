class TagsController < ApplicationController
	before_filter :require_login, only: [:destroy]
	# Instead of adding a deleting "feature" for tags
	# tags automatically remove themselves if they are
	# not associated with any articles
	def remove_empty_tags
		Tag.all.each do |tag|
			tag.destroy if tag.articles.size == 0
		end
	end

	def index
		remove_empty_tags
		@tags = Tag.all
	end
	def show
		@tag = Tag.find(params[:id])
	end
end
