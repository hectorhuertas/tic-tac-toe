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
    ai_move = available.sample
    board[ai_move] = 'x'
    save && {cell: ai_move}
  end

  def available
    board.select{|k,v| v==""}.keys
  end

  def game_over
    {over: score} if score
  end

  def score
    draw || player_score
  end

  def draw
    board.all?{|k,v| v.present?} && 0
  end

  def player_score
    case winner
    when "o" then  1
    when "x" then -1
    end
  end

  def combinations
    Board.win_combinations(size).map do |c|
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
