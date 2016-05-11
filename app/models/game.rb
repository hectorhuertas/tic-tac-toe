class Game < ActiveRecord::Base
  after_validation :create_board
  serialize :board, Array
  validates :size, inclusion: { in: [3,4,5] }

  def create_board
    self.size.times do |i|
      column = []
      self.size.times { |i| column << "" }
      self.board << column
    end
  end
end
