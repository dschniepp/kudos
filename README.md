# Kudos

[![Build Status](https://travis-ci.org/semlabs/kudos.svg?branch=master)](https://travis-ci.org/semlabs/kudos)

Kudos generates a licenses file in the root dir with the licenses of all dependencies.

## Installation

```elixir
def deps do
  [
    {:kudos, "~> 0.1.0"}
  ]
end
```

## How to use kudos

Print licenses to console:

`mix kudos.generate --dry-run`

Generate _licenses.md_ file in root:

`mix kudos.generate`

## Documentation

[https://hexdocs.pm/kudos](https://hexdocs.pm/kudos).
