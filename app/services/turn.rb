class Turn
  attr_reader :board, :player

  def initialize(board, player)
    @board = board
    @player = player
  end

  def best_move
    if player == 'x'
      available.min_by { |move| score_if(move)}
    else
      available.max_by { |move| score_if(move)}
    end
  end

  def best_score
    score_if(best_move)
  end

  def score_if(move)
    new_board = board.dup
    new_board[move] = player

    Score.new.of(new_board) || Turn.new(new_board,other(player)).best_score
  end

  def available
    board.select{|k,v| v==""}.keys
  end

  def other(player)
    player === 'o' ? 'x' : 'o'
  end
end
