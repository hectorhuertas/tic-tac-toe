require 'test_helper'

class GameTurnTest < ActionDispatch::IntegrationTest
  test "Game turn is played" do
    game = Game.create(size:3)

    get "/api/v1/games/#{game.id}/play", {cell:"01"}

    json = JSON.parse(response.body)

    assert_equal json['cell'], "22"
    assert_equal true, "Incomplete test"
  end
end
