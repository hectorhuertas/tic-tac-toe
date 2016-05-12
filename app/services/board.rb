module Board
  def self.win_combinations(size)
    rows = []
    columns = []
    diagonals = [[],[]]

    size.times do |i|
      diagonals[0] << "#{i}#{i}"
      diagonals[1] << "#{i}#{size - 1 - i}"

      size.times do |j|
        rows[j] ||= []
        columns[j] ||= []
        rows[j] << "#{j}#{i}"
        columns[j] << "#{i}#{j}"
      end
    end

    rows + columns + diagonals
  end
end
