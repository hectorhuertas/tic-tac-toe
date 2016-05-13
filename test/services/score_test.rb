require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  test "Score for an indetermined do not exist" do
    board = { "00"=>"x", "01"=>"o", "02"=>"",
              "10"=>"o", "11"=>"x", "12"=>"",
              "20"=>"", "21"=>"", "22"=>""}

    refute Score.new.of(board)
  end

  test "Score for a draw" do
    board = { "00"=>"x", "01"=>"o", "02"=>"x",
              "10"=>"o", "11"=>"o", "12"=>"x",
              "20"=>"o", "21"=>"x", "22"=>"o"}

    assert_equal 0 , Score.new.of(board)
  end

  test "Score for player victory" do
    board = { "00"=>"o", "01"=>"o", "02"=>"o",
              "10"=>"x", "11"=>"x", "12"=>"",
              "20"=>"", "21"=>"", "22"=>""}

    assert_equal 7 , Score.new.of(board)
  end

  test "Score for different player victory" do
    board = { "00"=>"o", "01"=>"o", "02"=>"x",
              "10"=>"x", "11"=>"o", "12"=>"",
              "20"=>"", "21"=>"x", "22"=>"o"}

    assert_equal 6 , Score.new.of(board)
  end

  test "Score for ai victory" do
    board = { "00"=>"o", "01"=>"o", "02"=>"",
              "10"=>"x", "11"=>"x", "12"=>"x",
              "20"=>"o", "21"=>"", "22"=>""}

    assert_equal -7 , Score.new.of(board)
  end

  test "Score for different ai victory" do
    board = { "00"=>"o", "01"=>"o", "02"=>"",
              "10"=>"x", "11"=>"x", "12"=>"x",
              "20"=>"o", "21"=>"o", "22"=>"x"}

    assert_equal -6 , Score.new.of(board)
  end
end
