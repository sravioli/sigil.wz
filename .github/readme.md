# sigil.wz

[![Awesome](https://awesome.re/mentioned-badge.svg)](https://github.com/michaelbrusegard/awesome-wezterm)
[![Tests](https://img.shields.io/github/actions/workflow/status/sravioli/sigil.wz/tests.yaml?label=Tests&logo=Lua)](https://github.com/sravioli/sigil.wz/actions?workflow=tests)
[![Lint](https://img.shields.io/github/actions/workflow/status/sravioli/sigil.wz/lint.yaml?label=Lint&logo=Lua)](https://github.com/sravioli/sigil.wz/actions?workflow=lint)
[![Coverage](https://img.shields.io/coverallsCoverage/github/sravioli/sigil.wz?label=Coverage&logo=coveralls)](https://coveralls.io/github/sravioli/sigil.wz)

Icons and identity colors for [WezTerm](https://wezfurlong.org/wezterm/).

Sigil is a small registry for process, tool, and UI icons. It can return plain
glyphs for labels, color metadata for your own renderer, or raw
`wezterm.format()` items that can be passed directly to WezTerm or appended to a
`ribbon.wz` ribbon.

## Installation

```lua
local wezterm = require "wezterm"

-- from git
local sigil = wezterm.plugin.require "https://github.com/sravioli/sigil.wz"

-- from a local checkout
local sigil = wezterm.plugin.require("file:///" .. wezterm.config_dir .. "/plugins/sigil.wz")
```

### Type annotations

Sigil ships LuaCATS annotations. After installing
[wezterm-types](https://github.com/DrKJeff16/wezterm-types), annotate the import
to get completion and type checking:

```lua
---@type Sigil.Api
local sigil = wezterm.plugin.require "https://github.com/sravioli/sigil.wz"
```

## Usage

```lua
local sigil = wezterm.plugin.require "https://github.com/sravioli/sigil.wz"

local entry = sigil.get "nvim"
-- { name = "Neovim", icon = "...", color = "#57A143" }

local icon = sigil.icon "nvim"
local color = sigil.color "nvim"
```

Aliases and executable paths are normalized:

```lua
sigil.icon "pwsh.exe"
sigil.icon "C:\\Program Files\\PowerShell\\7\\pwsh.exe"
sigil.icon "docker-compose"
```

## Built-in entries

Sigil keeps its default registry split by purpose:

- `terminals`: shells, terminal emulators, and remote session tools
- `editors`: Vim, Neovim, Helix, VS Code, and similar editors
- `languages`: language and file-format identities
- `runtimes`: executable runtimes such as Node, Deno, and Bun
- `package_managers`: build tools and dependency managers
- `databases`: database CLIs and engines
- `infra`: containers, orchestration, cloud, and provisioning tools
- `tools`: general command-line utilities

The public API does not expose those files directly. They are merged into one
registry, so `sigil.get "nvim"`, `sigil.get "node"`, and `sigil.get "kubectl"`
all use the same lookup path.

## Format items

`items()` returns an array accepted by `wezterm.format()`:

```lua
local items = sigil.items "nvim"
-- {
--   { Foreground = { Color = "#57A143" } },
--   { Text = "..." },
--   "ResetAttributes",
-- }

local rendered = sigil.format "nvim"
```

You can control spacing and reset behavior per call:

```lua
sigil.items("nvim", {
  padding = "right",
  reset = false,
})
```

Supported padding values are `false`, `true`, `"left"`, `"right"`, and
`"both"`. `true` is the same as `"both"`.

## Ribbon

Sigil pairs well with [ribbon.wz](https://github.com/sravioli/ribbon.wz):

```lua
local ribbon = require "plugs.ribbon"
local sigil = require "plugs.sigil"

local title = ribbon:new "Tab"
title
  :append_items(sigil.items("nvim", { padding = "right" }))
  :append(nil, "White", "init.lua")

return title:format()
```

## Configuration

`setup()` deep-merges your options with Sigil defaults.

```lua
sigil.setup {
  fallback = {
    enabled = true,
    icon = "?",
    color = "#a6adc8",
    name = "Unknown",
  },

  formatting = {
    reset = true,
    padding = false,
  },

  overrides = {
    nvim = {
      color = "#57A143",
      aliases = { "neovim", "editor" },
    },
  },
}
```

### `fallback`

Unknown keys return the fallback entry by default. Disable it when you prefer
`nil` for missing entries:

```lua
sigil.setup {
  fallback = {
    enabled = false,
  },
}
```

### `formatting`

These are the defaults used by `items()` and `format()`. Per-call options win
over global formatting.

### `overrides`

Use `overrides` to change built-in entries without redefining the whole
registry. Table fields are merged with the default entry.

```lua
sigil.setup {
  overrides = {
    git = {
      color = "#ff6f61",
    },
  },
}
```

## Custom entries

```lua
sigil.add("my-tool", {
  name = "My Tool",
  icon = "T",
  color = "#ffffff",
  aliases = { "tool.exe" },
})
```

Custom entries are available through `get`, `icon`, `color`, `items`, and
`format`.

## Symbols

Sigil also ships reusable UI symbols for status bars, tab titles, mode labels,
separators, battery indicators, and clock indicators.

```lua
local folder = sigil.symbol "Folder"
local tab_right = sigil.symbol "Sep.tb.right"
local symbols = sigil.symbols()
```

These are kept separate from the semantic registry because they describe UI
parts rather than programs.

## License

Code is licensed under the [GNU General Public License v3](../LICENSE).
Documentation is licensed under the terms in [LICENSE-DOCS](../LICENSE-DOCS).
