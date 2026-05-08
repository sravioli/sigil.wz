local sigil = require "sigil.api"
local wezterm = require "wezterm"

describe("sigil.wz", function()
  before_each(function()
    wezterm._reset()
    sigil.setup()
  end)

  it("returns default entries by key", function()
    local entry = sigil.get "nvim"

    assert.are.equal("Neovim", entry.name)
    assert.are.equal("nf:custom_neovim", entry.icon)
    assert.are.equal("#57A143", entry.color)
  end)

  it("resolves aliases and executable paths", function()
    assert.are.equal(sigil.icon "pwsh", sigil.icon "C:\\Program Files\\PowerShell\\7\\pwsh.exe")
    assert.are.equal(sigil.icon "docker", sigil.icon "docker-compose")
    assert.are.equal(sigil.icon "copilot", sigil.icon "GitHub Copilot")
  end)

  it("returns icon and color helpers", function()
    assert.are.equal("nf:dev_vim", sigil.icon "vim")
    assert.are.equal("#019833", sigil.color "vim")
  end)

  it("returns wezterm format items for entries", function()
    assert.are.same({
      { Foreground = { Color = "#57A143" } },
      { Text = "nf:custom_neovim" },
      "ResetAttributes",
    }, sigil.items "nvim")
  end)

  it("supports padding and reset options for format items", function()
    assert.are.same({
      { Foreground = { Color = "#57A143" } },
      { Text = "nf:custom_neovim " },
    }, sigil.items("nvim", { padding = "right", reset = false }))
  end)

  it("delegates formatted strings to wezterm.format", function()
    assert.are.equal("<formatted>", sigil.format "nvim")
    assert.are.equal("format", wezterm._calls[1].fn)
    assert.are.same(sigil.items "nvim", wezterm._calls[1].args[1])
  end)

  it("returns fallback entries for unknown keys by default", function()
    local entry = sigil.get "missing"

    assert.are.equal("Unknown", entry.name)
    assert.are.equal("?", entry.icon)
    assert.are.equal("#a6adc8", entry.color)
  end)

  it("can disable fallback lookups", function()
    sigil.setup {
      fallback = {
        enabled = false,
      },
    }

    assert.is_nil(sigil.get "missing")
    assert.are.same({}, sigil.items "missing")
  end)

  it("merges user overrides into default entries", function()
    sigil.setup {
      overrides = {
        nvim = {
          color = "#00ff00",
          aliases = { "editor" },
        },
      },
    }

    assert.are.equal("#00ff00", sigil.color "nvim")
    assert.are.equal("nf:custom_neovim", sigil.icon "editor")
  end)

  it("registers custom entries", function()
    sigil.add("tool", {
      name = "Tool",
      icon = "T",
      color = "#ffffff",
      aliases = { "my-tool" },
    })

    assert.are.equal("T", sigil.icon "my-tool")
    assert.are.equal("#ffffff", sigil.color "tool")
  end)

  it("returns copied symbol groups", function()
    local symbols = sigil.symbols()
    symbols.Folder = "changed"

    assert.are.equal("nf:md_folder", sigil.symbol "Folder")
    assert.are.equal("nf:ple_lower_left_triangle", sigil.symbol "Sep.tb.right")
  end)

  it("supports symbol overrides", function()
    sigil.setup {
      symbols = {
        Folder = "F",
        Sep = {
          tb = {
            right = ">",
          },
        },
      },
    }

    assert.are.equal("F", sigil.symbol "Folder")
    assert.are.equal(">", sigil.symbol "Sep.tb.right")
  end)
end)
