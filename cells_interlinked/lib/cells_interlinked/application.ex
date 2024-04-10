defmodule CellsInterlinked.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  alias CellsInterlinked.Server
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: CellsInterlinked.Worker.start_link(arg)
      # {CellsInterlinked.Worker, arg}
      Server
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CellsInterlinked.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
