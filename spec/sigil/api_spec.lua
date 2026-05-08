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

  it("includes common runtime, editor, package, and infra aliases", function()
    assert.are.equal(sigil.icon "node", sigil.icon "node.exe")
    assert.are.equal(sigil.icon "npm", sigil.icon "npx")
    assert.are.equal(sigil.icon "vscode", sigil.icon "code.exe")
    assert.are.equal(sigil.icon "helix", sigil.icon "hx")
    assert.are.equal(sigil.icon "terraform", sigil.icon "opentofu")
    assert.are.equal(sigil.icon "sqlite", sigil.icon "sqlite3")
    assert.are.equal(sigil.icon "mongo", sigil.icon "mongosh")
    assert.are.equal(sigil.icon "rust", sigil.icon "rustup")
  end)

  it("loads entries from every default category", function()
    assert.are.equal("Alacritty", sigil.get("alacritty").name)
    assert.are.equal("Neovim", sigil.get("nvim").name)
    assert.are.equal("TypeScript", sigil.get("typescript").name)
    assert.are.equal("Node.js", sigil.get("node").name)
    assert.are.equal("pnpm", sigil.get("pnpm").name)
    assert.are.equal("PostgreSQL", sigil.get("psql").name)
    assert.are.equal("Kubernetes", sigil.get("kubectl").name)
    assert.are.equal("ripgrep", sigil.get("rg").name)
  end)

  it("resolves newer category aliases", function()
    assert.are.equal(sigil.icon "azure", sigil.icon "az")
    assert.are.equal(sigil.icon "aws", sigil.icon "aws-vault")
    assert.are.equal(sigil.icon "bun", sigil.icon "bunx")
    assert.are.equal(sigil.icon "pip", sigil.icon "pip3")
    assert.are.equal(sigil.icon "gem", sigil.icon "bundler")
    assert.are.equal(sigil.icon "kubernetes", sigil.icon "k9s")
    assert.are.equal(sigil.icon "typescript", sigil.icon "ts")
    assert.are.equal(sigil.icon "yaml", sigil.icon "yml")
  end)

  it("includes expanded default icon coverage", function()
    assert.are.equal("nf:dev_pycharm", sigil.icon "charm")
    assert.are.equal("nf:dev_vscode", sigil.icon "code")
    assert.are.equal("nf:dev_bun", sigil.icon "bun")
    assert.are.equal("nf:dev_denojs", sigil.icon "deno")
    assert.are.equal("nf:dev_microsoftsqlserver", sigil.icon "sqlcmd")
    assert.are.equal("nf:dev_homebrew", sigil.icon "homebrew")
    assert.are.equal("nf:dev_digitalocean", sigil.icon "doctl")
    assert.are.equal("nf:dev_gitlab", sigil.icon "gitlab")
    assert.are.equal("nf:custom_prettier", sigil.icon "prettier")
    assert.are.equal("nf:dev_vite", sigil.icon "vite")
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
