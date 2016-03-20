require_relative '../lib/world'

describe World do

  before(:each) do
    cells = dummy_data.split("\n").map{ |row| row.split.map(&:to_i) }
    @world = World.new(cells)
  end

  it 'initializes with width and heigth' do
    expect(@world.cells.length).to eql 25
  end

  it 'returns a cell at a x and y position' do
    expect(@world.cell_by_position(0, 2)).to eql @world.cells[2]
    expect(@world.cell_by_position(1, 0)).to eql @world.cells[5]
  end

  it "with no live neighbours" do
    cell = @world.cell_by_position(0, 0)
    cell.make_alive
    @world.next_generation
    cell.should be_dead
  end

  it "with one live neighbours" do
    cell = @world.cell_by_position(0, 0)
    cell.make_alive

    neighbour_cell = @world.cell_by_position(0, 1)
    neighbour_cell.make_alive

    @world.next_generation
    cell.should be_dead

    neighbour_cell.should be_dead
  end

  it 'with two live neighbours' do
    cell = @world.cell_by_position(2, 2)
    cell.make_alive

    cell_at_left = @world.cell_by_position(1, 2)
    cell_at_left.make_alive

    cell_at_right = @world.cell_by_position(3, 2)
    cell_at_right.make_alive

    @world.next_generation
    cell.should be_alive
    cell_at_left.should be_dead
    cell_at_right.should be_dead

  end

  it "with three live neighbours" do
    cell = @world.cell_by_position(2, 2)
    cell.make_alive

    cell_at_left = @world.cell_by_position(1, 2)
    cell_at_left.make_alive

    cell_at_right = @world.cell_by_position(3, 2)
    cell_at_right.make_alive

    cell_at_bottom = @world.cell_by_position(2, 3)
    cell_at_bottom.make_alive

    @world.next_generation
    cell.should be_alive
    cell_at_left.should be_alive
    cell_at_right.should be_alive
    cell_at_bottom.should be_alive
  end

  def dummy_data
    "0 0 0 0 0
     0 0 0 0 0
     0 0 0 0 0
     0 0 0 0 0
     0 0 0 0 0"
  end
end