class Game < ActiveRecord::Base
  after_validation :create_board
  serialize :board, Hash
  validates :size, inclusion: { in: [3,4,5] }

  def create_board
    size.times do |i|
      size.times { |j| board["#{i}#{j}"] ||= "" }
    end
  end

  def play(cell)
    board[cell] = 'o'
    # return score if game_over?
    # check game end
    ai_move = available.sample
    board[ai_move] = 'x'
    # check game end

    save && {cell: ai_move}
  end

  def available
    board.select{|k,v| v==""}.keys
  end

  def game_over?
    board.flatten.select {|i| i==""}.empty?
  end

  def score
    'score'
  end
end
