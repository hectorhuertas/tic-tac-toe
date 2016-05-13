class Turn
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def best_move(player)
    available.min_by do |move|
      new_board = board.dup
      new_board[move] = player
      Score.new.of(new_board) || 1000
    end
  end

  def available
    board.select{|k,v| v==""}.keys
  end
end
