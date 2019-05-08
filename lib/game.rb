require 'ruby2d'
require_relative 'board'

puts "Size of the grid:"
size = gets.chomp.to_i

set title: 'Game of Life'
set background: 'aqua'
set width: 25*size + size, height: 25*size + size

tick = 0
@board = Board.new(size)
@board.random_seed!

update do
  if tick % 60 == 0
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
