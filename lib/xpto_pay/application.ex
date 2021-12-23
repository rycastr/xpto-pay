defmodule XptoPay.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      XptoPay.Commanded
    ]

    opts = [strategy: :one_for_one, name: XptoPay.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
