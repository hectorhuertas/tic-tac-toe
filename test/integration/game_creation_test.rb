require 'test_helper'

class GameCreationTest < ActionDispatch::IntegrationTest
  test "game is created" do
    get '/api/v1/games/new?size=3'

    json = JSON.parse(response.body)
    game = Game.last

    assert_equal json['game']['size'], game.size
    assert_equal json['game']['id'], game.id
  end
end
