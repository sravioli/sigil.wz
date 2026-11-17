---@module "sigil.defaults.entries.terminals"

local glyph = require "sigil.defaults.glyph"

---@type table<string, Sigil.Entry>
return {
  alacritty = {
    name = "Alacritty",
    icon = glyph "cod_terminal",
    color = "#F46D01",
  },
  bash = {
    name = "Bash",
    icon = glyph "cod_terminal_bash",
    color = "#89E051",
  },
  cmd = {
    name = "Command Prompt",
    icon = glyph "md_console_line",
    color = "#C0C0C0",
  },
  csh = {
    name = "C shell",
    icon = glyph "cod_terminal",
    color = "#89E051",
    aliases = { "tcsh" },
  },
  dash = {
    name = "Dash",
    icon = glyph "cod_terminal",
    color = "#89E051",
  },
  elvish = {
    name = "Elvish",
    icon = glyph "cod_terminal",
    color = "#55BB55",
  },
  fish = {
    name = "fish",
    icon = glyph "md_fish",
    color = "#4AAE47",
  },
  foot = {
    name = "foot",
    icon = glyph "md_foot_print",
    color = "#DBDFE3",
  },
  ghostty = {
    name = "Ghostty",
    icon = glyph "md_ghost",
    color = "#3551F3",
  },
  ["gnome-terminal"] = {
    name = "GNOME Terminal",
    icon = glyph "linux_gnome",
    color = "#4A86CF",
    aliases = { "gnome-terminal-server" },
  },
  iterm2 = {
    name = "iTerm2",
    icon = glyph "md_apple_finder",
    color = "#4A4A4A",
    aliases = { "iterm" },
  },
  kitty = {
    name = "kitty",
    icon = glyph "md_cat",
    color = "#784421",
  },
  konsole = {
    name = "Konsole",
    icon = glyph "linux_kde",
    color = "#1D99F3",
  },
  ksh = {
    name = "KornShell",
    icon = glyph "cod_terminal",
    color = "#89E051",
  },
  nushell = {
    name = "Nushell",
    icon = glyph "cod_terminal",
    color = "#4E9A06",
    aliases = { "nu" },
  },
  pwsh = {
    name = "PowerShell",
    icon = glyph "md_console",
    color = "#5391FE",
    aliases = { "powershell" },
  },
  rio = {
    name = "Rio",
    icon = glyph "md_waves",
    color = "#E94560",
  },
  screen = {
    name = "GNU Screen",
    icon = glyph "cod_terminal_tmux",
    color = "#4E9A06",
  },
  sh = {
    name = "sh",
    icon = glyph "cod_terminal",
    color = "#89E051",
  },
  ssh = {
    name = "SSH",
    icon = glyph "md_ssh",
    color = "#A6E3A1",
  },
  tmux = {
    name = "tmux",
    icon = glyph "cod_terminal_tmux",
    color = "#1BB91F",
  },
  warp = {
    name = "Warp",
    icon = glyph "md_rocket",
    color = "#01A4FF",
  },
  wezterm = {
    name = "WezTerm",
    icon = glyph "cod_terminal",
    color = "#7AA2F7",
  },
  windows_terminal = {
    name = "Windows Terminal",
    icon = glyph "cod_terminal",
    color = "#4D76CD",
    aliases = { "wt" },
  },
  xonsh = {
    name = "xonsh",
    icon = glyph "cod_terminal",
    color = "#3776AB",
  },
  zellij = {
    name = "Zellij",
    icon = glyph "md_view_dashboard_variant",
    color = "#E8A33E",
  },
  zsh = {
    name = "Zsh",
    icon = glyph "dev_terminal",
    color = "#89E051",
  },
}
