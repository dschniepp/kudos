defmodule Kudos do
  @moduledoc """
  Documentation for Kudos.
  """
  
  @license_file_names ~w(LICENSE.txt LICENSE.md LICENSE license.txt license.md license LICENSE-2.0.txt)

  @doc """
  Generates a licenses file in the root dir with the licenses of all deps.

  ## Examples

      iex> Kudos.generate()
      :ok
      
  """  
  def generate do
    content = 
    load_deps_meta_data()
    |> Enum.reduce(header(), fn(meta_data, resp) ->
      resp <> format(meta_data)
    end)
    |> String.trim()
    
    File.write("licenses.md", content)
  end

  defp header() do
    """
    # Project Licenses
    This file was generated by the kudos utility. It contains the name, version and checksum, description, links, maintainers and license information for every dependency in this project.

    ## Dependencies
    """
  end

  defp format(meta_data) do
    """
    ### #{meta_data.name} (Version #{meta_data.version} | Checksum: #{meta_data.checksum})
    #{meta_data.description}

    Links: #{links(meta_data.links)}

    Maintainers: #{maintainers(meta_data.maintainers)}

    Licenses Used: #{meta_data.licenses}

    #{meta_data.license_file}
    """
  end

  defp maintainers(values) do
    Enum.join(values, ", ")
  end

  defp links(values) do
    values
    |> Enum.map(fn(value) -> "[#{elem(value, 0)}](#{elem(value, 1)})" end)
    |> Enum.join(", ")
  end

  defp load_deps_meta_data() do
    Mix.Dep.loaded([])
    |> Enum.map(fn(dep) ->
      Mix.Dep.in_dependency(dep, fn _ ->
        %{
          name: Atom.to_string(Mix.Project.config[:app]),
          version: Mix.Project.config[:version],
          checksum: elem(dep.opts[:lock], 3),
          description: Mix.Project.config[:description],
          source_url: Mix.Project.config[:source_url],
          links: get_in(Mix.Project.config, [:package, :links]),
          maintainers: get_in(Mix.Project.config, [:package, :maintainers]),
          licenses: get_in(Mix.Project.config, [:package, :licenses]),
          license_file: get_license_file_content(dep.opts[:dest])
        }
      end)
    end)
  end

  defp get_license_file_content(path) do
    File.ls!(path) -- (File.ls!(path) -- @license_file_names)
    |> read_license_file(path)
  end

  defp read_license_file([], _path) do
    "Full license text not found in dependency source."
  end
  defp read_license_file([first_file_name | _], path) do
    Path.join(path, first_file_name)
    |> File.read!()
  end
end
