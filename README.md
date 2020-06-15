# Kudos

Kudos generates a licenses file in the root dir with the licenses of all dependencies.

## Installation

```elixir
def deps do
  [
    {:kudos, "~> 0.2.0"}
  ]
end
```

## How to use kudos

Generate _licenses.md_ file in root:

`mix kudos.generate`

Print licenses to console:

`mix kudos.generate --dry-run`

## Documentation

[https://hexdocs.pm/kudos](https://hexdocs.pm/kudos).
