class Cell
  attr_reader :x, :y
  attr_accessor :alive

  def initialize(x=0, y=0, state=false)
    @x = x
    @y = y
    @alive = state
  end

  def alive?
    @alive
  end

  def kill!
    @alive = false
  end

  def revive!
    @alive = true
  end

  def neighbour?(cell)
    (@x + 1 == cell.x or @x - 1 == cell.x or @x == cell.x) and
      (@y + 1 == cell.y  or @y - 1 == cell.y or @y == cell.y)
  end
end
