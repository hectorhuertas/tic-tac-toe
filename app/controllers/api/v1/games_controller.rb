class Api::V1::GamesController < Api::ApiController
  def new
    render json: {game:{size:3}}
  end
end
