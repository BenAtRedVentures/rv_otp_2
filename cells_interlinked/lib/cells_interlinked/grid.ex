defmodule CellsInterlinked.Grid do
  alias CellsInterlinked.Cell

  def new(height \\ 10, width \\ 10) do
    for x <- 1..width,
        y <- 1..height,
        into: %{},
        do: {{x, y}, Enum.random([true, false])}
  end

  def evolve(grid) do
    for {k, v} <- grid,
        into: %{},
        do: {k, Cell.next_gen(grid[k], neighbor_count(grid, k))}
  end

  def neighbor_count(grid, {x, y}) do
    for(
      xx <- (x - 1)..(x + 1),
      yy <- (y - 1)..(y + 1),
      {xx, yy} !== {x, y},
      into: [],
      do: grid[{xx, yy}]
    )
    |> Enum.count(fn cell -> cell end)
  end

  def show(grid) do
    {max_x, max_y} = get_bounds(grid)

    for row <- 1..max_y do
      show_row(grid, row, max_x)
    end
    |> Enum.join("\n")
  end

  defp show_row(grid, y, width) do
    for col <- 1..width do
      grid[{col, y}]
      |> Cell.show()
    end
    |> Enum.join("")
  end

  defp get_bounds(grid) do
    grid
    |> Enum.reduce({1, 1}, fn {{x, y}, v}, {max_x, max_y} ->
      {if(x > max_x, do: x, else: max_x), if(y > max_y, do: y, else: max_y)}
    end)
  end
end
