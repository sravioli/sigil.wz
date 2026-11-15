# sigil.wz

[![Awesome](https://awesome.re/mentioned-badge.svg)](https://github.com/michaelbrusegard/awesome-wezterm)
[![Tests](https://img.shields.io/github/actions/workflow/status/sravioli/sigil.wz/tests.yaml?style=flat-square&label=tests)](https://github.com/sravioli/sigil.wz/actions/workflows/tests.yaml)
[![Lint](https://img.shields.io/github/actions/workflow/status/sravioli/sigil.wz/lint.yaml?style=flat-square&label=lint)](https://github.com/sravioli/sigil.wz/actions/workflows/lint.yaml)
[![Coverage](https://img.shields.io/coverallsCoverage/github/sravioli/sigil.wz?label=Coverage&logo=coveralls)](https://coveralls.io/github/sravioli/sigil.wz)
[![Code license](https://img.shields.io/badge/code-GPL--2.0-blue?style=flat-square)](../LICENSE)
[![Docs license](https://img.shields.io/badge/docs-CC_BY--NC_4.0-blue?style=flat-square)](../LICENSE-DOCS)

Named icons, identity colors, and UI symbols for [WezTerm](https://wezterm.org/).

Look up a program by executable name or alias, then use its glyph, color
metadata, or ready-to-format items in your own renderer. A separate symbol
catalog supplies folders, separators, mode labels, battery levels, and clocks.

[Quick start](#quick-start) · [Usage](#usage) · [Configuration](#configuration) · [API reference](#api-reference) · [Troubleshooting](#troubleshooting) · [Development](#development) · [License](#license)

## Quick start

### Requirements

Requires **WezTerm [`20230320-124340-559cb7b0`](https://wezterm.org/config/lua/wezterm.plugin/require.html)
or newer** and Git. Automatically loads [warp.wz](https://github.com/sravioli/warp.wz) and
[warden.wz](https://github.com/sravioli/warden.wz), preferring local API
modules; dependency failure raises. Invalid options are logged and ignored.
Use a suitable font for Nerd Font glyphs; unavailable glyph keys fall back
to text. Ribbon is an optional consumer, not a dependency.

### Install and run

Put this in `wezterm.lua`:

```lua
local wezterm = require "wezterm"
local sigil = wezterm.plugin.require "https://github.com/sravioli/sigil.wz"
local config = wezterm.config_builder()

wezterm.on("update-status", function(window)
  window:set_right_status(sigil.format "nvim")
end)

return config
```

Reload with the tab/status bar visible. Its right side shows Neovim's colored
icon (or its text fallback). In an existing config, reuse the builder and
integrate this call with the existing status renderer.

## Usage

### Identify an executable

After importing Sigil:

```lua
local entry = sigil.get "C:\\Program Files\\PowerShell\\7\\pwsh.exe"
wezterm.log_info(entry.name)
local icon = sigil.icon "docker-compose"
local color = sigil.color "docker"
```

Lookup trims whitespace, takes the basename, lowercases it, and resolves
registered aliases. Known `.exe` names are aliases; arbitrary extensions are
not stripped. An entry has `key`, optional `name`, required `icon`, optional
`color`, and optional `aliases`.

The registry includes terminals, editors, languages, runtimes, package managers,
databases, infrastructure, and general tools. Use `all()` to see its current
entries.

### Add an application and render it

```lua
sigil.add("my-tool", {
  name = "My Tool",
  icon = "T",
  color = "#ffffff",
  aliases = { "my-tool.exe" },
})
local items = sigil.items("my-tool.exe", { padding = "right" })
local rendered = wezterm.format(items)
```

Pass `rendered` to a status setter, or pass `items` to
[Ribbon's `append_items`](https://github.com/sravioli/ribbon.wz).
`items` returns foreground, text, then a reset by default. A custom sink or
renderer can instead use `entry.icon` and `entry.color`.

### Reuse UI symbols

```lua
local folder = sigil.symbol "Folder"
local separator = sigil.symbol "Sep.tb.right"
local symbols = sigil.symbols()
wezterm.log_info(folder .. separator)
```

Symbols use dotted paths, separate from program lookup. Paths may return a
glyph or a group table; unknown paths return `nil`. The
[symbol source](../plugin/sigil/defaults/symbols.lua) lists groups including
`Modes`, `Lantern`, `Sep`, `Bat`, `Nums`, and `Clock`.

## Configuration

### Example

Setup is optional. Call it after importing the plugin, before lookups and
runtime `add` calls. This example overrides a color and one symbol:

```lua
sigil.setup {
  formatting = { padding = "right" },
  overrides = { git = { color = "#ff6f61" } },
  symbols = { Folder = "dir" },
}
```

### Options

| Option | Type | Default | Description |
| --- | --- | --- | --- |
| `fallback.enabled` | `boolean` | `true` | Return a fallback entry for unknown names. |
| `fallback.icon` | `string` | `"?"` | Missing-entry glyph. |
| `fallback.color` | `string` | `"#a6adc8"` | Missing-entry foreground. |
| `fallback.name` | `string` | `"Unknown"` | Missing-entry label. |
| `formatting.reset` | `boolean` | `true` | Append `ResetAttributes` to formatted icons. |
| `formatting.padding` | `boolean\|"left"\|"right"\|"both"` | `false` | Surround icons with spaces; `true` means `"both"`. |
| `overrides` | `table<string, Sigil.Entry>` | `{}` | Partial entries merged into defaults; unknown keys can introduce entries with a required `icon`. |
| `symbols` | `table<string, any>` | `{}` | Nested overrides/additions to the separate symbol catalog. |
| `validate` | `boolean` | `true` | Check options with [warden.wz](https://github.com/sravioli/warden.wz). Set `false` to skip checks and never load warden. |

The full entry shape is in [registry.lua](../plugin/sigil/registry.lua).
Per-call `get`/`icon`/`color` options accept `fallback?`.
`items`/`format` also accept `padding?` and `reset?`, using the same
types as the global formatting options.

#### Option validation

Options are checked against a schema when you call setup. Invalid fields are logged and ignored, and the rest still apply; unknown keys in fixed sections log a warning.
Set `validate = false` once your configuration is stable: warden is then never
downloaded or loaded, and the options are used exactly as written, so typos and
wrong types go unnoticed.

```lua
sigil.setup { validate = false }
```

### Behavior and precedence

`setup` starts from fresh defaults, deep-merges options, and rebuilds the
registry. Repeating it discards previous runtime `add` entries; add them again
after setup. Configuration and custom entries do not persist across reloads.

Maps merge recursively and lists replace, including an entry's `aliases`
list. An empty list can remove the configured alias list, but the canonical
lookup remains. Per-call `fallback`, `padding`, and `reset` override their
global values, including explicit `false`.

Sigil does not validate settings or entry data against a schema.
Supply valid color strings and an `icon` for new entries. Registration
overwrites conflicting aliases, so avoid sharing an alias between entries.
Updating an entry with `add` does not clean up old alias
mappings, so use setup to rebuild the registry when removing aliases.

`get`, `add`'s result, `all`, `symbol`, and `symbols` return copies rather than
the live registry. Editing those results does not reconfigure Sigil.
Missing entries with fallback disabled produce `nil` from lookup helpers,
`{}` from `items`, and an empty formatted string from `format`.

## API reference

`?` marks optional arguments or nullable results. Calls use `.`, not `:`.
Types and current defaults live in the [source](../plugin/sigil/core.lua).

| Signature → Return type | Description |
| --- | --- |
| `sigil.setup(options?) → Sigil.Config` | Reset options to defaults plus overrides and rebuild entries. |
| `sigil.config.setup(options?) → Sigil.Config` | Reset configuration only; does not rebuild an already initialized entry registry. Prefer `sigil.setup`. |
| `sigil.config.get() → Sigil.Config` | Return the live configuration table. |
| `sigil.config.defaults() → Sigil.Config` | Return a deep copy of default settings. |
| `sigil.add(key, entry) → Sigil.Entry` | Register/replace one complete entry, then return its copy. |
| `sigil.get(key, options?) → Sigil.Entry?` | Resolve a normalized name/alias; optional `fallback` overrides the global switch. |
| `sigil.icon(key, options?) → string?` | Return only the resolved glyph. |
| `sigil.color(key, options?) → string?` | Return only the resolved color; known entries may also omit color. |
| `sigil.items(key, options?) → Sigil.FormatItem[]` | Return format items with optional fallback, padding, and reset controls. |
| `sigil.format(key, options?) → string` | Render `items` using `wezterm.format`. |
| `sigil.symbol(path) → any?` | Resolve a dotted UI-symbol path in a copied, merged catalog. |
| `sigil.symbols() → table` | Return the complete copied symbol catalog. |
| `sigil.all() → table<string, Sigil.Entry>` | Return a deep copy of all canonical entries. |

For example, `sigil.get("missing", { fallback = false })` distinguishes a
missing entry from the default question-mark fallback. Format items reset
attributes but do not explicitly set a background.

## Troubleshooting

### An icon is a square or a question mark

A square usually means the active font/fallback lacks the glyph. Install a
suitable Nerd Font or override the icon with text. `"?"` can mean an unknown
entry or a glyph key absent from your WezTerm build; inspect `get` with
`fallback = false` to distinguish missing registry data.

### Custom entries disappear

Call `setup` before `add`. Each setup call rebuilds entries from defaults
and the supplied overrides.

### Formatting changes the following text

Keep `reset = true`, or reset attributes in your own renderer. When you compose
raw items, manage the complete formatting sequence yourself.

Update with `wezterm.plugin.update_all()` from the debug overlay and reload.
File [issues](https://github.com/sravioli/sigil.wz/issues) with the lookup key,
plugin revision, WezTerm version, and relevant custom entries.

## Development

### Local checkout

Load the working tree directly, so edits take effect on the next config
reload without a commit or a plugin update. Adjust the path to your clone:

```lua
local wezterm = require "wezterm"
local root = wezterm.home_dir .. "/path/to/sigil.wz/plugin/"
package.path = root .. "?.lua;" .. root .. "?/init.lua;" .. package.path
local sigil = require "sigil.api"
```

Warp and Warden must also be available through the loader or `package.path`.

### Editor support

Follow the [wezterm-types setup](https://github.com/DrKJeff16/wezterm-types):

```lua
---@type Sigil
local sigil = wezterm.plugin.require "https://github.com/sravioli/sigil.wz"
```

Its [Sigil definitions](https://github.com/DrKJeff16/wezterm-types/blob/main/lua/wezterm/types/plugins/sigil.lua)
cover the main operations, but type `config` as settings rather than the
configuration module and omit its methods. The source module is `Sigil.Api`;
use [local annotations](../plugin/sigil/api.lua) for the API in this revision.

### Checks and contributions

From the repository root, with Lua 5.4 and the named tools installed:

```sh
busted --verbose
luacheck plugin spec
selene --display-style=quiet plugin
stylua --check plugin spec
```

Specs mock WezTerm and Warp and load a sibling `../warden.wz` checkout. See the
[contribution guide](contributing.md) and use Conventional Commits.

## License

The [code license file](../LICENSE) contains GNU GPL v2; documentation uses
[CC BY-NC 4.0](../LICENSE-DOCS). Earlier README prose said GPL v3, which
conflicted with the license file. This update does not change license terms
or attribution.
