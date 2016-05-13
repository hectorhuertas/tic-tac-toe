require 'test_helper'

class GameTurnTest < ActionDispatch::IntegrationTest
  test "Game turn is played" do
    game = Game.create(size:3)
    game.board = {"00"=>"", "01"=>"", "02"=>"x",
                  "10"=>"", "11"=>"o", "12"=>"o",
                  "20"=>"o", "21"=>"x", "22"=>"x"}
    game.save

    get "/api/v1/games/#{game.id}/play", {cell:"01"}

    json = JSON.parse(response.body)

    assert json['cell']
  end

  test 'Game returns result when game is over by draw' do
    game = Game.create(size:3)
    game.board = {"00"=>"", "01"=>"o", "02"=>"x",
                  "10"=>"x", "11"=>"o", "12"=>"o",
                  "20"=>"o", "21"=>"x", "22"=>"x"}
    game.save

    get "/api/v1/games/#{game.id}/play", {cell:"00"}

    json = JSON.parse(response.body)

    assert_equal json['over'], 0
  end

  test 'Game returns result when game is over by player victory' do
    game = Game.create(size:3)
    game.board['01'] = 'o'
    game.board['02'] = 'o'
    game.save

    get "/api/v1/games/#{game.id}/play", {cell:"00"}

    json = JSON.parse(response.body)

    assert json['over'] > 0
  end

  test 'Game returns result when game is over by ai victory' do
    game = Game.create(size:3)
    game.board['20'] = 'x'
    game.board['21'] = 'x'
    game.board['22'] = 'x'
    game.save

    get "/api/v1/games/#{game.id}/play", {cell:"00"}

    json = JSON.parse(response.body)

    assert json['over'] < 0
  end
end
