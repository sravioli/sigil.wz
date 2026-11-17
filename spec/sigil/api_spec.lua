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
    assert.are.equal(sigil.icon "nvim", sigil.icon "C:\\Program Files\\Neovim\\bin\\nvim.exe")
    assert.are.equal(sigil.icon "intellij", sigil.icon "IDEA64.EXE")
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
    assert.are.equal("Arch Linux", sigil.get("archlinux").name)
    assert.are.equal("Firefox", sigil.get("firefox").name)
  end)

  it("maps keys and aliases to exactly one entry across categories", function()
    local registry = require "sigil.registry"
    local seen = {}
    for _, category in ipairs {
      "terminals",
      "editors",
      "languages",
      "runtimes",
      "package_managers",
      "databases",
      "infra",
      "tools",
      "os",
      "apps",
    } do
      for key, entry in pairs(require("sigil.defaults.entries." .. category)) do
        for _, name in ipairs { key, table.unpack(entry.aliases or {}) } do
          name = registry.normalize(name)
          assert.is_nil(
            seen[name],
            ("%s (%s) already used by %s"):format(name, key, tostring(seen[name]))
          )
          seen[name] = key
        end
      end
    end
  end)

  it("resolves common process names", function()
    assert.are.equal("Python", sigil.get("python3").name)
    assert.are.equal("btop", sigil.get("top").name)
    assert.are.equal("macOS", sigil.get("darwin").name)
    assert.are.equal("Claude Code", sigil.get("claude").name)
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

  it("returns raw nerdfont glyphs with a fallback", function()
    assert.are.equal("nf:md_folder", sigil.glyph "md_folder")
    local nf = wezterm.nerdfonts
    wezterm.nerdfonts = {}
    package.loaded["sigil.defaults.glyph"] = nil
    local fresh = require "sigil.defaults.glyph"
    assert.are.equal("", fresh("md_missing", ""))
    assert.are.equal("?", fresh "md_missing")
    wezterm.nerdfonts = nf
    package.loaded["sigil.defaults.glyph"] = nil
  end)

  it("ships status and catalogue symbols", function()
    assert.are.equal("nf:md_console", sigil.symbol "Process")
    assert.are.equal("nf:md_ssh", sigil.symbol "Domain.ssh")
    assert.are.equal("nf:md_circle_slice_8", sigil.symbol "Progress.steps.8")
    assert.are.equal("nf:md_cpu_64_bit", sigil.symbol "Status.cpu")
    assert.are.equal("nf:dev_git_branch", sigil.symbol "Git.branch")
    assert.are.equal("nf:cod_error", sigil.symbol "Diagnostics.error")
    assert.are.equal("nf:md_wifi_strength_4", sigil.symbol "Net.wifi.4")
    assert.are.equal("nf:ple_lower_right_triangle", sigil.symbol "Sep.triangle.lower_right")
    assert.are.equal(8, #sigil.symbol "Weather.moon")
    assert.are.equal(10, #sigil.symbol "NumsCircle")
    assert.is_nil(sigil.symbol "Status.nope")
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

  it("refreshes cached symbols after setup and copies table results", function()
    assert.are.equal("nf:md_folder", sigil.symbol "Folder")
    sigil.setup { symbols = { Folder = "F" } }
    assert.are.equal("F", sigil.symbol "Folder")

    local tb = sigil.symbol "Sep.tb"
    tb.right = "changed"
    assert.are.equal("nf:ple_lower_left_triangle", sigil.symbol "Sep.tb.right")
  end)

  describe("option validation", function()
    local function logged(fn_name)
      local n = 0
      for _, call in ipairs(wezterm._calls) do
        if call.fn == fn_name then
          n = n + 1
        end
      end
      return n
    end

    it("logs a wrong type and keeps the default and the valid fields", function()
      sigil.setup { fallback = { enabled = "yes", icon = "!" } }

      local fallback = sigil.config.get().fallback
      assert.is_true(fallback.enabled)
      assert.are.equal("!", fallback.icon)
      assert.are.equal(1, logged "log_error")
    end)

    it("warns about unknown keys in fixed sections", function()
      sigil.setup { formatting = { pading = "left" } }

      assert.are.equal(1, logged "log_warn")
      assert.is_false(sigil.config.get().formatting.padding)
    end)

    it("still extends defaults with custom symbols", function()
      sigil.setup { symbols = { mything = { icon = "x" } } }

      assert.are.equal(0, logged "log_error" + logged "log_warn")
      assert.is_not_nil(sigil.config.get().symbols.mything)
      assert.are.equal("Neovim", sigil.get("nvim").name)
    end)

    it("ignores a non-table options value", function()
      assert.has_no.errors(function()
        sigil.setup "oops"
      end)
    end)

    it("skips validation and never loads warden when validate = false", function()
      local deps = require "sigil.deps"
      local real = deps.warden
      finally(function()
        deps.warden = real
      end)
      deps.warden = function()
        error "warden loaded"
      end

      local cfg = sigil.config.setup { validate = false, fallback = { enabled = "yes" } }

      assert.are.equal("yes", cfg.fallback.enabled)
      assert.are.equal(0, logged "log_error" + logged "log_warn")
    end)
  end)
end)
