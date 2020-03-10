defmodule ElixirIon.Commit do
  use Committee
  import Committee.Helpers, only: [staged_files: 0, staged_files: 1]

  @impl true
  @doc """
  This function auto-runs `mix format` on staged files.
  """
  def pre_commit do
    System.cmd("mix", ["format"] ++ staged_files([".ex", ".exs"]))
    System.cmd("git", ["add"] ++ staged_files())
  end
end
