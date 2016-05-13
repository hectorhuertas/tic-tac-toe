class Score
  attr_reader :board

  def initialize(board, move, player)
    @board = board
    board[move] = player
  end

  def player_score
    # binding.pry
    case winner
    when "o" then  1
    when "x" then -1
    end
  end

  def combinations
    Board.win_combinations(3).map do |c|
      c.map{ |cell| board[cell] }
    end
  end

  def winning_combinations
    combinations.select { |c| c.uniq.size == 1 }
  end

  def winner
    winning_combinations.map(&:first).reject(&:blank?).first
  end
end
