class Api::V1::GamesController < Api::ApiController
  def new
    Game.create
    # render json: {game:{size:3}}
    render json: Game.create
  end
end
