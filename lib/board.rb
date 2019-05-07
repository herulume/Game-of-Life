require_relative 'cell'

class Board
  attr_reader :matrix

  def initialize(size=10)
    @size = size
    @matrix = []

    (0...size).each do |row|
      (0...size).each do |col|
        @matrix << Cell.new(row, col)
      end
    end
  end

  def alive_cells
    @matrix.select { |cell| cell.alive? }
  end

  def dead_cells
    @matrix.select { |cell| not cell.alive? }
  end

  def neighbour_cells(own_cell)
    @matrix.select { |cell| cell.neighbour?(own_cell) and cell.alive? }
  end

  def random_seed!
    @matrix.map { |cell| cell.alive = [true, false].sample }
  end

  def next!
    @matrix.each do |cell|
      neighbours = neighbour_cells(cell).count

      if cell.alive? && neighbours < 2
        cell.kill!
      end

      if cell.alive? && neighbours > 3
        cell.kill!
      end

      if (not cell.alive?) && neighbours == 3
        cell.revive!
      end
    end
  end
end
