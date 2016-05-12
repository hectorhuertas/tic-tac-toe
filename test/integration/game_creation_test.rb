require 'test_helper'

class GameCreationTest < ActionDispatch::IntegrationTest
  test "Game is created" do
    size = 4;
    post "/api/v1/games", game:{size:size}

    json = JSON.parse(response.body)
    game = Game.last

    assert_equal size, json['game']['size']
    assert_equal size, game.size
    assert_equal game.id, json['game']['id']
  end
end
