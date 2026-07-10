ExUnit.start()
# Enable the SQL sandbox so every test runs in a transaction
# that rolls back automatically. Tests never pollute each other.
Ecto.Adapters.SQL.Sandbox.mode(ElixirBase.Repo, :manual)
