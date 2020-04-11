class GamesController < ApplicationController

  def create
    game = Game.new(game_params)

    if game.save
      redirect_to game_path(game)
    else
      redirect_to users_path
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def update

  end

  private
    def game_params
      params.require(:game).permit(:x_user_id, :o_user_id, :grid)
    end
end