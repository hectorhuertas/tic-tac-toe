require 'test_helper'

class TurnTest < ActiveSupport::TestCase

    test "AI best move with winning chance" do
      board = { "00"=>"", "01"=>"o", "02"=>"x",
                "10"=>"", "11"=>"o", "12"=>"",
                "20"=>"o", "21"=>"", "22"=>"x"}

      assert_equal "12", Turn.new(board, 'x').best_move
    end

    test "AI best move for draw (requires higher cell)" do
      board = { "00"=>"", "01"=>"o", "02"=>"x",
                "10"=>"", "11"=>"o", "12"=>"o",
                "20"=>"o", "21"=>"x", "22"=>"x"}

      assert_equal "10", Turn.new(board, 'x').best_move
    end

    test "AI best move for draw with other setup (requires lower cell)" do
      board = { "00"=>"x", "01"=>"o", "02"=>"x",
                "10"=>"o", "11"=>"o", "12"=>"",
                "20"=>"o", "21"=>"x", "22"=>""}
      assert_equal "12", Turn.new(board, 'x').best_move
    end
end
