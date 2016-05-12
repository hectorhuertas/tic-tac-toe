class Api::V1::GamesController < Api::ApiController
  def create
    render json: Game.create(game_params)
  end

  def play
    render json: Game.find(params[:id]).play(play_params)
  end

  private
    def game_params
      params.require(:game).permit(:size)
    end

    def play_params
      params.require(:play).permit(:cell)
    end
end
