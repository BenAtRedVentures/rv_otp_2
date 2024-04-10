defmodule CellsInterlinked.Server do
  use GenServer
  alias CellsInterlinked.Grid
  # Callbacks

  def start_link(grid) do
    GenServer.start_link(CellsInterlinked.Server, grid, name: :cells_interlinked)
  end

  def restart(pid \\ :cells_interlinked) do
    GenServer.cast(pid, {:restart})
  end

  def evolve(pid \\ :cells_interlinked) do
    GenServer.cast(pid, {:evolve})
  end

  def show(pid \\ :cells_interlinked) do
    pid
    |> GenServer.call({:show})
    |> IO.puts()
  end

  @impl true
  def init(_grid) do
    initial_state = Grid.new()
    {:ok, initial_state}
  end

  @impl true
  def handle_call({:show}, _from, grid) do
    {:reply, Grid.show(grid), grid}
  end

  @impl true
  def handle_cast({:evolve}, grid) do
    {:noreply, grid |> Grid.evolve()}
  end

  @impl true
  def handle_cast({:restart}, grid) do
    {:noreply, Grid.new()}
  end
end
