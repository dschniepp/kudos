defmodule Kudos.Mixfile do
  use Mix.Project

  def project do
    [
      app: :kudos,
      version: "0.3.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Kudos",
      source_url: "https://github.com/dschniepp/kudos"
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
    "Kudos generates a `licenses.md` file in the root dir including the licenses of all dependencies."
  end

  defp package() do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Daniel Schniepp"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/dschniepp/kudos"}
    ]
  end
end
