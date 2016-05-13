class Turn
  attr_reader :board, :player

  def initialize(board, player)
    @board = board
    @player = player
  end

  def best_move
    return shortcuts if first_counter && shortcuts
    if player == 'x'
      available.min_by { |move| score_if(move)}
    else
      available.max_by { |move| score_if(move)}
    end
  end

  def shortcuts
    return '00' if board["11"] != ""
    return '11' if %w(00 20 02 22).any? {|move| board[move] != ""}
  end

  def first_counter
    board.reject {|_, move| move==""}.size == 1
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
