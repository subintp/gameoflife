class Cell

  LIVE = 1
  DEAD = 0

  attr_reader :world, :x, :y, :live

  def initialize(world, x, y, live)
    @world, @x, @y, @live = world, x, y, live
  end

  def alive?
    @live == LIVE
  end

  def dead?
    @live == DEAD
  end

  def kill
    @live = DEAD
  end

  def make_alive
    @live = LIVE
  end

  def swap_life
    if alive?
      kill
    elsif dead?
      make_alive
    end
  end

  def alive_neighbours
    neighbours.select do |n|
      n && n.alive?
    end
  end

  def neighbours
    world.cells.each.inject([]) do |neighbours,cell|

     if self.x == cell.x && self.y == cell.y - 1
       neighbours << cell
     end

     if self.x == cell.x - 1 && self.y == cell.y - 1
       neighbours << cell
     end

     if self.x == cell.x + 1 && self.y == cell.y
       neighbours << cell
     end

     if self.x == cell.x - 1 && self.y == cell.y
       neighbours << cell
     end

     neighbours
   end
  end

end
