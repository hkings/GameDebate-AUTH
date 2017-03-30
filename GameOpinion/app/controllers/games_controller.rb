class GamesController < ApplicationController
	before_action :set_game, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def show

	end

	def index
		@games = Game.all
	end

	def new
		@game = Game.new
	end

	def create
		@game = Game.new(game_params)
		@game.user = current_user
		if @game.save
			redirect_to root_path
		else
			redirect_to :back
		end
	end

	def edit

	end

	def update
		if @game.update(game_params)
			redirect_to @game
		else
			redirect_to :back
		end
	end

	def destroy
		@game.destroy
		redirect_to root_path
	end

	def newest
		@games = Game.all.reverse
	end

	def hot
		@games = Game.joins(:comments).where('comments.created_at BETWEEN ? AND ?', 6.hours.ago, Time.now).group('games.id').order('COUNT(comments.id)').shuffle
	end

	private
		def set_game
			@game = Game.find(params[:id])
		end

		def game_params
			params.require(:game).permit(:title, :description, :image)
		end
end
