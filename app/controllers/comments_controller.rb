class CommentsController < ApplicationController
	include CommentsHelper

	def create
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]

		redirect_to article_path(@comment.article_id)
	end
end
