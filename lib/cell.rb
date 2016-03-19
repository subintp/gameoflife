class Cell

  LIVE = 1
  DEAD = 0

  attr_reader :world, :x, :y

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
    neighbours = []

    neighbours.push(@world.cell_by_position(self.x + 1, self.y - 1))
    neighbours.push(@world.cell_by_position(self.x + 1, self.y))
    neighbours.push(@world.cell_by_position(self.x + 1, self.y + 1))

    neighbours.push(@world.cell_by_position(self.x, self.y - 1))
    neighbours.push(@world.cell_by_position(self.x, self.y + 1))

    neighbours.push(@world.cell_by_position(self.x - 1, self.y - 1))
    neighbours.push(@world.cell_by_position(self.x - 1, self.y))
    neighbours.push(@world.cell_by_position(self.x - 1, self.y + 1))

    neighbours
  end

end
