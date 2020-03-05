defmodule ElixirIon.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_ion,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
      # if you want to use espec,
      # test_coverage: [tool: ExCoveralls, test_task: "espec"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:inner_cotton, "~> 0.6", only: [:dev, :test]},
      {:pre_commit, "~> 0.3.4", only: :dev},
      {:excoveralls, "~> 0.12.2"}
    ]
  end

  defp aliases do
    [
      watch: ["cotton.watch"],
      check: ["cotton.lint"],
      fix: ["cotton.lint --fix"]
    ]
  end
end
