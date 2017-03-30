class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def new
		@comment = Comment.new
	end

	def create

		game = Game.find(params[:game_id])
		game.comments.create(comment_params)
		redirect_to :back
	end


	def destroy
		@comment.find(params[:id])
		@comment.destroy
		redirect_to :back
	end

	private
		def comment_params
			params.require(:comment).permit(:body).merge(user: current_user)
		end

end
