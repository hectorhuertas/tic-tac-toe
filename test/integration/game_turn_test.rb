require 'test_helper'

class GameTurnTest < ActionDispatch::IntegrationTest
  test "Game turn is played" do
    game = Game.create(size:3)

    get "/api/v1/games/#{game.id}/play", {cell:"01"}

    json = JSON.parse(response.body)

    assert json['cell']
  end

  test 'Game returns score when game is over' do
    skip
  end
end
