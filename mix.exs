defmodule Miapp.MixProject do
  use Mix.Project

  def project do
    [
      app: :miapp,
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: Mix.compilers() ++ [:surface],
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Miapp.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev), do: ["lib"] ++ catalogues()
  defp elixirc_paths(_), do: ["lib"]

  defp catalogues do
    [
      "priv/catalogue",
      "deps/surface/priv/catalogue"
    ]
  end

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.6.13"},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.17.5"},
      {:floki, ">= 0.30.0", only: :test},
      {:phoenix_live_dashboard, "~> 0.6"},
      {:esbuild, "~> 0.4", runtime: Mix.env() == :dev},
      {:tailwind, "~> 0.1", runtime: Mix.env() == :dev},
      {:dart_sass, "~> 0.4", runtime: Mix.env() == :dev},
      {:surface, "~> 0.8"},
      {:surface_catalogue, "~> 0.5.1"},
      {:credo, "~> 1.6"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:gettext, "~> 0.18"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.5"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "cmd npm --prefix=./assets i"],
      lint: ["format", "credo --strict"],
      test: ["test"],
      server: ["assets.deploy", "phx.server"],
      build: ["cmd rm -rf _build", "compile.app", "deps.compile"],
      "assets.clean": ["phx.digest.clean --all"],
      "assets.deploy": [
        "sass default --no-source-map",
        "tailwind default --minify",
        "esbuild default --minify",
        "phx.digest priv/static -o priv/public"
      ]
    ]
  end
end
