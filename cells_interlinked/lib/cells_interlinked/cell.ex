defmodule CellsInterlinked.Cell do

  # Rule 1. IF a cell has less than two neighbors in the next generation it will die of loneliness
  #
  #Rule 2. IF a cell has more than three neighbors in the next generation it will die of overcrowding
  #
  #Rule 3: IF a cell has 3 neighbors, conditions are perfect, and in the next generation it will spring to life
  #
  #Rule 4: IF a cell has two neighbors, in the next generation it will stay the same

  def next_gen(cell, 2)  do
    cell
  end
  def next_gen(cell, 3) do
    true
  end
  def next_gen(cell, neighbor_count) when neighbor_count < 2 do
    false
  end
  def next_gen(cell, neighbor_count) when neighbor_count > 3 do
    false
  end

  def show(true) do
    "X"
  end
  def show(false) do
    "_"
  end
end
