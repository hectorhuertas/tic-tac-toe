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
    save && game_over || ai_play
  end

  def ai_play
    ai_turn = {cell: Turn.new(board, 'x').best_move}
    board[ai_turn[:cell]] = 'x'
    ai_turn[:over] = score if score
    save && ai_turn
  end

  def game_over
    {over: score} if score
  end

  def score
    Score.new.of(board)
  end
end
