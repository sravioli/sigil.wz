---@module "sigil.defaults"

local wezterm = require "wezterm" --[[@as Wezterm]]
local nf = wezterm.nerdfonts or {}

local M = {}

---@param name string
---@param fallback? string
---@return string
local function glyph(name, fallback)
  return nf[name] or fallback or "?"
end

---@type table<string, Sigil.Entry>
M.entries = {
  bash = {
    name = "Bash",
    icon = glyph "cod_terminal_bash",
    color = "#89E051",
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
  cargo = {
    name = "Cargo",
    icon = glyph "dev_rust",
    color = "#DEA584",
  },
  cmd = {
    name = "Command Prompt",
    icon = glyph "md_console_line",
    color = "#C0C0C0",
    aliases = { "cmd.exe", "c:\\windows\\system32\\cmd.exe" },
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
  docker = {
    name = "Docker",
    icon = glyph "linux_docker",
    color = "#2496ED",
    aliases = { "docker-compose", "kubectl", "kuberlr", "lazydocker" },
  },
  fish = {
    name = "fish",
    icon = glyph "md_fish",
    color = "#4AAE47",
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
  go = {
    name = "Go",
    icon = glyph "seti_go",
    color = "#00ADD8",
  },
  lazygit = {
    name = "lazygit",
    icon = glyph "cod_github",
    color = "#F05032",
  },
  lua = {
    name = "Lua",
    icon = glyph "seti_lua",
    color = "#2C2D72",
  },
  make = {
    name = "Make",
    icon = glyph "seti_makefile",
    color = "#427819",
  },
  node = {
    name = "Node.js",
    icon = glyph "md_nodejs",
    color = "#339933",
  },
  nvim = {
    name = "Neovim",
    icon = glyph "custom_neovim",
    color = "#57A143",
    aliases = { "neovim" },
  },
  pacman = {
    name = "Pacman",
    icon = glyph("linux_archlinux", "A"),
    color = "#1793D1",
    aliases = { "paru" },
  },
  perl = {
    name = "Perl",
    icon = glyph "seti_perl",
    color = "#39457E",
  },
  psql = {
    name = "PostgreSQL",
    icon = glyph "dev_postgresql",
    color = "#4169E1",
  },
  pwsh = {
    name = "PowerShell",
    icon = glyph "md_console",
    color = "#5391FE",
    aliases = { "pwsh.exe", "powershell" },
  },
  python = {
    name = "Python",
    icon = glyph "seti_python",
    color = "#3776AB",
  },
  ruby = {
    name = "Ruby",
    icon = glyph "cod_ruby",
    color = "#CC342D",
  },
  sudo = {
    name = "sudo",
    icon = glyph "fa_hashtag",
    color = "#E95420",
  },
  topgrade = {
    name = "Topgrade",
    icon = glyph "md_rocket_launch",
    color = "#7AA2F7",
  },
  vim = {
    name = "Vim",
    icon = glyph "dev_vim",
    color = "#019833",
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
  zsh = {
    name = "Zsh",
    icon = glyph "dev_terminal",
    color = "#89E051",
  },
}

M.symbols = {
  Notification = glyph "cod_circle_small_filled",
  Workspace = glyph "cod_briefcase",
  Folder = glyph "md_folder",
  Hostname = glyph "md_monitor_shimmer",
  Leader = glyph "md_lightning_bolt",
  Ellipsis = glyph "fa_ellipsis",

  Modes = {
    copy = glyph "md_content_copy",
    search = glyph "md_magnify",
    font = glyph "md_format_font",
    window = glyph "md_dock_window",
    help = glyph "md_help_box",
    lantern = glyph("md_flashlight", glyph "md_pickaxe"),
  },

  Lantern = {
    ico = glyph("md_flashlight", glyph "md_pickaxe"),
    fuzzy = {
      ico = glyph "cod_search_fuzzy",
      punct = "❭",
    },
    exact = {
      ico = glyph "cod_search",
      punct = ":",
    },
  },

  Sep = {
    block = "█",
    sb = {
      left = glyph "pl_left_hard_divider",
      right = glyph "pl_right_hard_divider",
      modal = glyph "ple_forwardslash_separator",
    },
    ws = {
      left = glyph "ple_right_half_circle_thick",
      right = glyph "ple_left_half_circle_thick",
    },
    tb = {
      leftmost = "▐",
      left = glyph "ple_upper_right_triangle",
      right = glyph "ple_lower_left_triangle",
    },
    leader = {
      right = glyph "ple_left_half_circle_thick",
      left = glyph "ple_right_half_circle_thick",
    },
  },

  Bat = {
    Full = {
      ["100"] = glyph "md_battery",
    },
    Charging = {
      ["00"] = glyph "md_battery_alert",
      ["10"] = glyph "md_battery_charging_10",
      ["20"] = glyph "md_battery_charging_20",
      ["30"] = glyph "md_battery_charging_30",
      ["40"] = glyph "md_battery_charging_40",
      ["50"] = glyph "md_battery_charging_50",
      ["60"] = glyph "md_battery_charging_60",
      ["70"] = glyph "md_battery_charging_70",
      ["80"] = glyph "md_battery_charging_80",
      ["90"] = glyph "md_battery_charging_90",
      ["100"] = glyph "md_battery_charging_100",
    },
    Discharging = {
      ["00"] = glyph "md_battery_outline",
      ["10"] = glyph "md_battery_10",
      ["20"] = glyph "md_battery_20",
      ["30"] = glyph "md_battery_30",
      ["40"] = glyph "md_battery_40",
      ["50"] = glyph "md_battery_50",
      ["60"] = glyph "md_battery_60",
      ["70"] = glyph "md_battery_70",
      ["80"] = glyph "md_battery_80",
      ["90"] = glyph "md_battery_90",
      ["100"] = glyph "md_battery",
    },
  },

  Nums = {
    glyph "md_numeric_1",
    glyph "md_numeric_2",
    glyph "md_numeric_3",
    glyph "md_numeric_4",
    glyph "md_numeric_5",
    glyph "md_numeric_6",
    glyph "md_numeric_7",
    glyph "md_numeric_8",
    glyph "md_numeric_9",
    glyph "md_numeric_10",
  },

  Clock = {
    night = {
      ["00"] = glyph "md_clock_time_twelve",
      ["01"] = glyph "md_clock_time_one",
      ["02"] = glyph "md_clock_time_two",
      ["03"] = glyph "md_clock_time_three",
      ["04"] = glyph "md_clock_time_four",
      ["05"] = glyph "md_clock_time_five",
      ["06"] = glyph "md_clock_time_six",
      ["07"] = glyph "md_clock_time_seven",
      ["08"] = glyph "md_clock_time_eight",
      ["09"] = glyph "md_clock_time_nine",
      ["10"] = glyph "md_clock_time_ten",
      ["11"] = glyph "md_clock_time_eleven",
      ["12"] = glyph "md_clock_time_twelve",
    },
    day = {
      ["00"] = glyph "md_clock_time_twelve_outline",
      ["01"] = glyph "md_clock_time_one_outline",
      ["02"] = glyph "md_clock_time_two_outline",
      ["03"] = glyph "md_clock_time_three_outline",
      ["04"] = glyph "md_clock_time_four_outline",
      ["05"] = glyph "md_clock_time_five_outline",
      ["06"] = glyph "md_clock_time_six_outline",
      ["07"] = glyph "md_clock_time_seven_outline",
      ["08"] = glyph "md_clock_time_eight_outline",
      ["09"] = glyph "md_clock_time_nine_outline",
      ["10"] = glyph "md_clock_time_ten_outline",
      ["11"] = glyph "md_clock_time_eleven_outline",
      ["12"] = glyph "md_clock_time_twelve_outline",
    },
  },
}

return M
