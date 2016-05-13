class Turn
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def best_move(player)
    available.min_by do |move|
      # binding.pry
      Score.new(board, move, player).player_score || 1000
    end
  end

  def available
    board.select{|k,v| v==""}.keys
  end
end
