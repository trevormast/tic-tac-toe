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
    game = Game.find(params[:id])

    game.grid[params[:grid_index].to_i] = params[:player_token]

    if game.save
      ActionCable.server.broadcast('games', active_player_id: game.active_player.id, grid: game.grid)
      head :ok
    end
  end

  private
    def game_params
      params.require(:game).permit(:x_user_id, :o_user_id, :grid)
    end
end