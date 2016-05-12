class Api::V1::GamesController < Api::ApiController
  def create
    render json: Game.create(game_params)
  end

  def play
    render json: Game.find(params[:id]).play(params[:cell])
  end

  private
    def game_params
      params.require(:game).permit(:size)
    end
end
