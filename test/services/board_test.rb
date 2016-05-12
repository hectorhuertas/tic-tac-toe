require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  test "Board win combinations for size 3" do
    actual = Board.win_combinations(3)
    expected = [
      ["00", "01", "02"],
      ["10", "11", "12"],
      ["20", "21", "22"],

      ["00", "10", "20"],
      ["01", "11", "21"],
      ["02", "12", "22"],

      ["00", "11", "22"],
      ["02", "11", "20"]
    ]

    assert_equal expected , actual
  end

  test "Board win combinations for size 4" do
    actual = Board.win_combinations(4)
    expected = [
      ["00", "01", "02", "03"],
      ["10", "11", "12", "13"],
      ["20", "21", "22", "23"],
      ["30", "31", "32", "33"],

      ["00", "10", "20", "30"],
      ["01", "11", "21", "31"],
      ["02", "12", "22", "32"],
      ["03", "13", "23", "33"],

      ["00", "11", "22", "33"],
      ["03", "12", "21", "30"]
    ]

    assert_equal expected , actual
  end
end
