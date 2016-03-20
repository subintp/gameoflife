require './lib/world'

class GameOfLife

  def self.perform(cells, times)
    self.new(cells, times).perform
  end

  def initialize(cells, times)
    @times = times
    @world = World.new(cells)
  end

  def perform
    @world.perform_regeneration(@times)
    @world.pretty_display
  end

end