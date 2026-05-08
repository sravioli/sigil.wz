---@module "sigil.defaults.entries.tools"

local glyph = require "sigil.defaults.glyph"

---@type table<string, Sigil.Entry>
return {
  awk = {
    name = "awk",
    icon = glyph "cod_terminal",
    color = "#A6E3A1",
  },
  bat = {
    name = "bat",
    icon = glyph "md_file_document",
    color = "#F5A97F",
  },
  btm = {
    name = "bottom",
    icon = glyph "md_chart_donut_variant",
    color = "#6C7086",
  },
  btop = {
    name = "btop",
    icon = glyph "md_chart_areaspline",
    color = "#6C7086",
    aliases = { "htop" },
  },
  cmake = {
    name = "CMake",
    icon = glyph "seti_makefile",
    color = "#064F8C",
  },
  copilot = {
    name = "GitHub Copilot",
    icon = glyph "cod_copilot",
    color = "#6CC644",
    aliases = { "github copilot", "🤖" },
  },
  curl = {
    name = "curl",
    icon = glyph "mdi_flattr",
    color = "#073551",
  },
  direnv = {
    name = "direnv",
    icon = glyph "md_folder_key",
    color = "#40B5A4",
  },
  fd = {
    name = "fd",
    icon = glyph "md_file_find",
    color = "#89B4FA",
  },
  fzf = {
    name = "fzf",
    icon = glyph "cod_search_fuzzy",
    color = "#40B5A4",
  },
  gh = {
    name = "GitHub CLI",
    icon = glyph "dev_github_badge",
    color = "#181717",
  },
  git = {
    name = "Git",
    icon = glyph "dev_git",
    color = "#F05032",
  },
  gitui = {
    name = "GitUI",
    icon = glyph "fa_git",
    color = "#F05032",
  },
  grep = {
    name = "grep",
    icon = glyph "md_magnify",
    color = "#A6E3A1",
  },
  jq = {
    name = "jq",
    icon = glyph "seti_json",
    color = "#40B5A4",
  },
  just = {
    name = "just",
    icon = glyph "seti_makefile",
    color = "#F5A97F",
  },
  lazygit = {
    name = "lazygit",
    icon = glyph "cod_github",
    color = "#F05032",
  },
  less = {
    name = "Less",
    icon = glyph "dev_less",
    color = "#1D365D",
  },
  nancy = {
    name = "Nancy",
    icon = glyph "dev_nancy",
    color = "#E95420",
  },
  rg = {
    name = "ripgrep",
    icon = glyph "md_magnify",
    color = "#F5A97F",
    aliases = { "ripgrep" },
  },
  sed = {
    name = "sed",
    icon = glyph "cod_terminal",
    color = "#A6E3A1",
  },
  starship = {
    name = "Starship",
    icon = glyph "md_rocket_launch",
    color = "#DD0B78",
  },
  sudo = {
    name = "sudo",
    icon = glyph "fa_hashtag",
    color = "#E95420",
  },
  tar = {
    name = "tar",
    icon = glyph "md_archive",
    color = "#CBA6F7",
  },
  topgrade = {
    name = "Topgrade",
    icon = glyph "md_rocket_launch",
    color = "#7AA2F7",
  },
  unzip = {
    name = "unzip",
    icon = glyph "md_archive_arrow_down",
    color = "#CBA6F7",
  },
  wget = {
    name = "wget",
    icon = glyph "mdi_arrow_down_box",
    color = "#1E88E5",
  },
  yazi = {
    name = "Yazi",
    icon = glyph "md_duck",
    color = "#FFCC66",
  },
  zip = {
    name = "zip",
    icon = glyph "md_archive_arrow_up",
    color = "#CBA6F7",
  },
}
