defmodule Mix.Tasks.Hooks.Install do
  use Mix.Task
  @moduledoc false

  @shortdoc "Installs git hooks"

  def run(_) do
    dest = Path.join([".git", "hooks", "pre-commit"])
    File.cp!("scripts/pre-commit", dest)
    File.chmod!(dest, 0o755)
    Mix.shell().info("Git hooks installed.")
  end
end
