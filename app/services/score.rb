class Score
  attr_reader :board

  def of(board)
    @board = board
    score || draw
  end

  def score
    winner && (winner=="o" ? 10 - circles : circles - 10)
  end

  def circles
    board.count {|_, move| move=="o"}
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
    # have board include a key with its own size
    Board.win_combinations(3).map do |c|
      c.map{ |cell| board[cell] }
    end
  end
end
