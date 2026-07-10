defmodule ElixirBase.Schema do
  @moduledoc """
  Base macro for all Ecto schemas in this project.

  Instead of writing these three lines in every schema file:

      use Ecto.Schema
      @primary_key {:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id

  Every schema does this instead:

      use ElixirBase.Schema

  What this configures:
  - UUID (binary_id) primary keys — random, non-guessable, safe in URLs
  - UUID foreign keys — all belongs_to references are also UUIDs
  - Microsecond UTC timestamps — utc_datetime_usec avoids ordering bugs
    when two records are inserted within the same second
  - Imports Ecto.Changeset so every schema can call cast/validate_* directly
  """

  defmacro __using__(_opts) do
    quote do
      use Ecto.Schema
      import Ecto.Changeset

      @primary_key {:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id
      @timestamps_opts [type: :utc_datetime_usec]
    end
  end
end
