class Game < ActiveRecord::Base
  after_validation :create_board
  serialize :board, Array
  validates :size, inclusion: { in: [3,4,5] }

  def create_board
    size.times do |i|
      column = []
      size.times { |i| column << "" }
      board << column
    end
  end

  def play(cell)
    x = cell[0].to_i
    y = cell[1].to_i
    board[x][y] = 'o'
    return score if game_over?
    # # over || playAI
    # over || ai
    # # update board
    # check game end
    # play ai
    # check game end
    {cell:'22'}
  end

  def game_over?
    board.flatten.select {|i| i==""}.empty?
  end

  def score
    'score'
  end
end
