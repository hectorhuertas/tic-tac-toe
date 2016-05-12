class Api::V1::GamesController < Api::ApiController
  def new
    render json: Game.create(size: params[:size])
  end
end
