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

  def best_move
    b = free(board).max_by do |move|
      move
    end
    Turn.new(board).best_move('x')
    #  binding.pry
    #  b
  end

  def free(board)
    board.select{|k,v| v==""}.keys
  end

  def deep_score(player, cell)
    board[cell] = player
    score || deep_score(other(player), cell)
  end

  def other(player)
    player === 'o' ? 'x' : 'o'
  end

  def ai_play
    # ai_turn = {cell: best_move(board)}
    # ai_turn = {cell: Turn.new(board).best_move('x')}
    ai_turn = {cell: available.sample}
    board[ai_turn[:cell]] = 'x'
    ai_turn[:over] = score if score
    save && ai_turn
  end

  def available
    board.select{|k,v| v==""}.keys
  end

  def game_over(ai_move = nil)
    {over: score} if score
  end

  def score
    player_score || draw
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
