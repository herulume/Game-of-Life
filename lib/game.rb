require 'ruby2d'
require_relative 'board'

set title: 'Game of life'
set background: 'aqua'

tick = 0
@board = Board.new
@board.random_seed!

update do
  if tick % 80 == 0
    @board.next!

    @board.matrix.each do |cell|
      cell.alive? ? color = 'black' : color = 'white'
      x = cell.x + 25 * cell.x
      y = cell.y + 25 * cell.y
      Square.new(x: x, y: y, size: 25, color: color)
    end
  end
tick += 1
end

show
