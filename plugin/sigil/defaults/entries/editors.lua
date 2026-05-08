---@module "sigil.defaults.entries.editors"

local glyph = require "sigil.defaults.glyph"

---@type table<string, Sigil.Entry>
return {
  emacs = {
    name = "Emacs",
    icon = glyph("custom_emacs", glyph "cod_terminal"),
    color = "#7F5AB6",
  },
  helix = {
    name = "Helix",
    icon = glyph "cod_edit",
    color = "#A277FF",
    aliases = { "hx" },
  },
  micro = {
    name = "Micro",
    icon = glyph "cod_edit",
    color = "#2AA198",
  },
  nano = {
    name = "nano",
    icon = glyph "cod_edit",
    color = "#4E9A06",
  },
  nvim = {
    name = "Neovim",
    icon = glyph "custom_neovim",
    color = "#57A143",
    aliases = { "neovim" },
  },
  vim = {
    name = "Vim",
    icon = glyph "dev_vim",
    color = "#019833",
  },
  vscode = {
    name = "Visual Studio Code",
    icon = glyph "dev_visualstudio",
    color = "#007ACC",
    aliases = { "code", "code.exe", "code-insiders", "code-insiders.exe" },
  },
  zed = {
    name = "Zed",
    icon = glyph "cod_edit",
    color = "#7F52FF",
  },
}
