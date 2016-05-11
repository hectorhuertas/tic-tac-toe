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
    board = [["", "", ""], ["", "", ""], ["", "", ""]]
    assert_equal board, game.board
  end

  test "Game board is created from size 4" do
    game = Game.create(size:4)
    board = [["", "", "", ""], ["", "", "", ""], ["", "", "", ""], ["", "", "", ""]]
    assert_equal board, game.board
  end
end
