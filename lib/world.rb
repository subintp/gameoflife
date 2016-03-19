require './lib/cell'
class World

  attr_reader :cells

  def initialize(cells)
    populate_cells(cells)
  end

  def cell_by_position(x, y)
    @cells[x][y] if @cells[x]
  end

  def for_each_cell_with_index
     @cells.each_with_index do |row, row_index|
       row.each_with_index do |column, column_index|
         yield row_index, column_index
       end
     end
  end

  def next_generation
    affected = @cells.flatten.each.inject([]) do |affected,cell|
               affected.push(cell) if(cell.alive? && cell.alive_neighbours.length < 2)
               affected
              end
    affected.each(&:swap_life)
  end

  private

  def populate_cells(cells)
    @cells = cells.dup
    cells.each_with_index do |row, row_index|
      row.each_with_index  do |column, column_index|
        @cells[row_index][column_index] = Cell.new(self, row_index, column_index, cells[row_index][column_index])
      end
    end
  end

end
