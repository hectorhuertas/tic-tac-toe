require 'test_helper'

class GameCreationTest < ActionDispatch::IntegrationTest
  test "game is created" do
    get '/api/v1/game/new?size=3'

    json = JSON.parse(response.body)

    assert_equal json.game.size, 3
  end
end
