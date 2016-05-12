class Api::V1::GamesController < Api::ApiController
  def create
    render json: Game.create(game_params)
  end

  private
    def game_params
      params.require(:game).permit(:size)
    end
end
