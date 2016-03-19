require_relative '../lib/cell'
require_relative '../lib/world'
require 'pry'

describe Cell do

  before do
    cells = dummy_file_data.split("\n").map{ |row| row.split.map(&:to_i) }
    @world = World.new(cells)
  end

  it 'belongs to a world' do
    cell = Cell.new(@world, 0, 0, 1)
    expect(cell.world).to eql @world
  end

  it 'initializes with coordinates' do
    cell = Cell.new(@world, 0, 1, 1)
    expect(cell.x).to eql 0
    expect(cell.y).to eql 1
  end

  it 'toggle life' do
    cell = @world.cell_by_position(1, 1)
    cell.swap_life
    expect(cell).to be_dead
    cell.swap_life
    expect(cell).to be_alive
  end


  it 'returns the live neighbours' do
    cell = @world.cell_by_position(1, 1)
    right_bottom_cell = @world.cell_by_position(2, 2)
    right_bottom_cell.make_alive
    bottom_cell = @world.cell_by_position(2, 1)
    bottom_cell.make_alive

    just_right =  @world.cell_by_position(1, 2)
    just_right.kill

    alive_neighbours = cell.alive_neighbours
    expect(alive_neighbours.length).to eql 2
    expect(alive_neighbours).to include(right_bottom_cell)
    expect(alive_neighbours).to include(bottom_cell)
  end

  def dummy_file_data
    "0 0 0 1
     0 1 1 0
     0 1 1 1
     1 0 0 0"
  end

end
