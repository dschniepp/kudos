defmodule Kudos.Mixfile do
  use Mix.Project

  def project do
    [
      app: :kudos,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Kudos",
      source_url: "https://github.com/semlabs/kudos"
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
      {:ex_doc, "~> 0.16", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "Fetches licenses of deps and generates a stashed license file in the root directory."
  end

  defp package() do
    [
      files: ["lib", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
      maintainers: ["Daniel Schniepp"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/semlabs/kudos"}
    ]
  end
end
