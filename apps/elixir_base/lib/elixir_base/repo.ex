defmodule ElixirBase.Repo do
  use Ecto.Repo,
    otp_app: :elixir_base,
    adapter: Ecto.Adapters.Postgres
end
