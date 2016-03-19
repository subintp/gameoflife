require_relative '../lib/world'
require 'pry'

describe World do

  before do
    cells = dummy_data.split("\n").map{ |row| row.split.map(&:to_i) }
    @world = World.new(cells)
  end

  it 'initializes with width and heigth' do
    expect(@world.cells.length).to eql 4
    expect(@world.cells.first.length).to eql 4
  end

  it 'returns a cell at a x and y position' do
    expect(@world.cell_by_position(0, 2)).to eql @world.cells[0][2]
    expect(@world.cell_by_position(1, 0)).to eql @world.cells[1][0]
  end

  def dummy_data
    "0 0 0 1
     0 0 1 0
     0 1 1 1
     1 0 0 0"
  end
end