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
    aliases = { "cmd.exe", "c:\\windows\\system32\\cmd.exe" },
  },
  fish = {
    name = "fish",
    icon = glyph "md_fish",
    color = "#4AAE47",
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
    aliases = { "pwsh.exe", "powershell", "powershell.exe" },
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
  wezterm = {
    name = "WezTerm",
    icon = glyph "cod_terminal",
    color = "#7AA2F7",
  },
  windows_terminal = {
    name = "Windows Terminal",
    icon = glyph "cod_terminal",
    color = "#4D76CD",
    aliases = { "wt", "wt.exe" },
  },
  zsh = {
    name = "Zsh",
    icon = glyph "dev_terminal",
    color = "#89E051",
  },
}
