class Score
  attr_reader :board

  def of(board)
    @board = board
    player_score || draw
  end

  def player_score
    case winner
    when "o" then  1
    when "x" then -1
    end
  end

  def draw
    board.all?{|k,v| v.present?} && 0
  end

  def winner
    winning_combinations.map(&:first).reject(&:blank?).first
  end

  def winning_combinations
    combinations.select { |c| c.uniq.size == 1 }
  end

  def combinations
    Board.win_combinations(3).map do |c|
      c.map{ |cell| board[cell] }
    end
  end
end
