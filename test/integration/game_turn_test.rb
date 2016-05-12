require 'test_helper'

class GameTurnTest < ActionDispatch::IntegrationTest
  test "Game turn is played" do
    game = Game.create(size:3)

    get "/api/v1/games/#{game.id}/play", {play:{cell:'01'}}

    assert false, "Uncomplete test"
  end
end
