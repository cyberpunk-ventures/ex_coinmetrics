defmodule ExCoinmetrics.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_coinmetrics,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ExCoinmetrics.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:tesla, "~> 1.0.0"},
      {:jason, ">= 1.0.0"},
      {:hackney, "~> 1.10"},
      {:csv, "~> 2.0"},
      {:nimble_csv, "~> 0.4"}
    ]
  end
end
