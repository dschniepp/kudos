defmodule Mix.Tasks.Kudos.Generate do
    use Mix.Task
  
    @shortdoc "Generates a licenses file"
    @recursive true

    def run(_) do
      IO.puts("Generating Licenses file...")
      case Kudos.generate() do
        :ok -> IO.puts("Done!")
        _ -> IO.puts("Failed!")
      end
    end
  end