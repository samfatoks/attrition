defmodule Attrition.MixProject do
  use Mix.Project

  def project do
    [
      app: :attrition,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      # dialyzer: [:unmatched_returns, :ignore_warnings, remove_defaults: [:unknown]],
      dialyzer: [
        plt_apps: [:dialyzer, :elixir, :kernel, :mix, :stdlib, :erlex],
        ignore_warnings: ".dialyzer_ignore.exs",
        flags: [:unmatched_returns, :error_handling, :underspecs]
      ],
      name: "Attrition",
      source_url: "https://github.com/jeremyjh/dialyxir",
      homepage_url: "https://github.com/jeremyjh/dialyxir",
      docs: [main: "readme", extras: ["README.md"]]
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
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false, optional: true},
      {:ex_doc, "~> 0.21", only: [:release, :dev]}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp description do
    """
    Library that allows easy addition and removal of html attributes.
    """
  end
  defp package do
    [
      files: [
        "lib",
        "mix.exs",
        "README.md",
        "LICENSE"
      ],
      maintainers: ["Samuel Fatoki"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/samfatoks/attrition"}
    ]
  end
end
