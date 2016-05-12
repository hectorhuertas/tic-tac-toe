require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "Game size default is 3" do
    assert_equal 3, Game.new.size
  end

  test "Game size must be 3, 4 or 5" do
    refute Game.new(size:0).valid?
    refute Game.new(size:2).valid?
    refute Game.new(size:6).valid?
  end

  test "Game board is created from size 3" do
    game = Game.create(size:3)
    board = {"00"=>"", "01"=>"", "02"=>"", "10"=>"", "11"=>"", "12"=>"", "20"=>"", "21"=>"", "22"=>""}
    assert_equal board, game.board
  end

  test "Game board is created from size 4" do
    game = Game.create(size:4)
    board = {"00"=>"", "01"=>"", "02"=>"", "03"=>"", "10"=>"", "11"=>"", "12"=>"", "13"=>"", "20"=>"", "21"=>"", "22"=>"", "23"=>"", "30"=>"", "31"=>"", "32"=>"", "33"=>""}
    assert_equal board, game.board
  end

  test "Score is nil while game is not over" do
    game = Game.create(size:3)

    refute game.score

    game.play('00')
    game.play('21')

    refute game.score
  end

  test "Score is 1 when player wins" do
    game = Game.create(size:3)

    game.play('00')
    game.play('10')
    game.play('20')

    assert_equal game.score, 1
  end

  test "Score is 1 when player wins with different combination" do
    game = Game.create(size:3)

    game.play('20')
    game.play('21')
    game.play('22')

    assert_equal game.score, 1
  end

  test "Score is 1 when player wins with diagonal combination" do
    game = Game.create(size:3)

    game.play('00')
    game.play('11')
    game.play('22')

    assert_equal game.score, 1
  end

  test "Score is 1 when player wins with different diagonal" do
    game = Game.create(size:4)

    game.play('30')
    game.play('21')
    game.play('12')
    game.play('03')

    assert_equal game.score, 1
  end

  test "Score is -1 when ai wins" do
    game = Game.create(size:3)

    game.board['00'] = "x"
    game.board['01'] = "x"
    game.board['02'] = "x"

    assert_equal game.score, -1
  end

  test "Score is 0 when draw" do
    game = Game.create(size:3)

    game.board = {"00"=>"0", "01"=>"o", "02"=>"x",
                  "10"=>"x", "11"=>"o", "12"=>"o",
                  "20"=>"o", "21"=>"x", "22"=>"x"}

    assert_equal game.score, 0
  end
end
