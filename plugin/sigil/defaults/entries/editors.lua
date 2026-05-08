---@module "sigil.defaults.entries.editors"

local glyph = require "sigil.defaults.glyph"

---@type table<string, Sigil.Entry>
return {
  emacs = {
    name = "Emacs",
    icon = glyph("custom_emacs", glyph "cod_terminal"),
    color = "#7F5AB6",
  },
  datagrip = {
    name = "DataGrip",
    icon = glyph "dev_datagrip",
    color = "#21D789",
    aliases = { "datagrip64.exe" },
  },
  goland = {
    name = "GoLand",
    icon = glyph "dev_goland",
    color = "#00ADD8",
    aliases = { "goland64.exe" },
  },
  helix = {
    name = "Helix",
    icon = glyph "cod_edit",
    color = "#A277FF",
    aliases = { "hx" },
  },
  intellij = {
    name = "IntelliJ IDEA",
    icon = glyph "dev_intellij",
    color = "#FE315D",
    aliases = { "idea", "idea64.exe" },
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
  phpstorm = {
    name = "PhpStorm",
    icon = glyph "dev_phpstorm",
    color = "#B345F1",
    aliases = { "phpstorm64.exe" },
  },
  pycharm = {
    name = "PyCharm",
    icon = glyph "dev_pycharm",
    color = "#21D789",
    aliases = { "charm", "pycharm64.exe" },
  },
  rider = {
    name = "Rider",
    icon = glyph "dev_rider",
    color = "#E8348C",
    aliases = { "rider64.exe" },
  },
  sublime = {
    name = "Sublime Text",
    icon = glyph "dev_sublime",
    color = "#FF9800",
    aliases = { "subl", "sublime_text", "sublime_text.exe" },
  },
  vim = {
    name = "Vim",
    icon = glyph "dev_vim",
    color = "#019833",
  },
  vscode = {
    name = "Visual Studio Code",
    icon = glyph "dev_vscode",
    color = "#007ACC",
    aliases = { "code", "code.exe", "code-insiders", "code-insiders.exe" },
  },
  visualstudio = {
    name = "Visual Studio",
    icon = glyph "dev_visualstudio",
    color = "#5C2D91",
    aliases = { "devenv", "devenv.exe" },
  },
  webstorm = {
    name = "WebStorm",
    icon = glyph "dev_webstorm",
    color = "#00CDD7",
    aliases = { "webstorm64.exe" },
  },
  zed = {
    name = "Zed",
    icon = glyph "cod_edit",
    color = "#7F52FF",
  },
}
