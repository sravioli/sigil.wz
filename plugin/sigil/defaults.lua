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
  cargo = {
    name = "Cargo",
    icon = glyph "dev_rust",
    color = "#DEA584",
  },
  clang = {
    name = "Clang",
    icon = glyph "dev_c",
    color = "#A8B9CC",
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
  crystal = {
    name = "Crystal",
    icon = glyph "seti_crystal",
    color = "#000000",
  },
  curl = {
    name = "curl",
    icon = glyph "mdi_flattr",
    color = "#073551",
  },
  deno = {
    name = "Deno",
    icon = glyph("seti_javascript", glyph "dev_javascript"),
    color = "#000000",
  },
  docker = {
    name = "Docker",
    icon = glyph "linux_docker",
    color = "#2496ED",
    aliases = { "docker-compose", "kubectl", "kuberlr", "lazydocker", "podman" },
  },
  dotnet = {
    name = ".NET",
    icon = glyph "dev_dotnet",
    color = "#512BD4",
    aliases = { "csharp", "c#", "fsharp", "f#" },
  },
  emacs = {
    name = "Emacs",
    icon = glyph("custom_emacs", glyph "cod_terminal"),
    color = "#7F5AB6",
  },
  fd = {
    name = "fd",
    icon = glyph "md_file_find",
    color = "#89B4FA",
  },
  fish = {
    name = "fish",
    icon = glyph "md_fish",
    color = "#4AAE47",
  },
  fzf = {
    name = "fzf",
    icon = glyph "cod_search_fuzzy",
    color = "#40B5A4",
  },
  gcc = {
    name = "GCC",
    icon = glyph "dev_gnu",
    color = "#A42E2B",
    aliases = { "cc", "g++", "c++" },
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
  gofmt = {
    name = "gofmt",
    icon = glyph "seti_go",
    color = "#00ADD8",
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
  gradle = {
    name = "Gradle",
    icon = glyph("seti_gradle", glyph "dev_java"),
    color = "#02303A",
  },
  helix = {
    name = "Helix",
    icon = glyph "cod_edit",
    color = "#A277FF",
    aliases = { "hx" },
  },
  html = {
    name = "HTML",
    icon = glyph "dev_html5",
    color = "#E34F26",
    aliases = { "html5" },
  },
  java = {
    name = "Java",
    icon = glyph "dev_java",
    color = "#E76F00",
    aliases = { "javac", "java.exe" },
  },
  javascript = {
    name = "JavaScript",
    icon = glyph "dev_javascript",
    color = "#F7DF1E",
    aliases = { "js" },
  },
  jq = {
    name = "jq",
    icon = glyph "seti_json",
    color = "#40B5A4",
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
  markdown = {
    name = "Markdown",
    icon = glyph "dev_markdown",
    color = "#083FA1",
    aliases = { "md" },
  },
  mongo = {
    name = "MongoDB",
    icon = glyph "dev_mongodb",
    color = "#47A248",
    aliases = { "mongosh", "mongodb" },
  },
  mysql = {
    name = "MySQL",
    icon = glyph "dev_mysql",
    color = "#4479A1",
  },
  nancy = {
    name = "Nancy",
    icon = glyph "dev_nancy",
    color = "#E95420",
  },
  nginx = {
    name = "NGINX",
    icon = glyph "dev_nginx",
    color = "#009639",
  },
  node = {
    name = "Node.js",
    icon = glyph "md_nodejs",
    color = "#339933",
    aliases = { "node.exe", "nodejs" },
  },
  npm = {
    name = "npm",
    icon = glyph "dev_npm",
    color = "#CB3837",
    aliases = { "npx" },
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
  php = {
    name = "PHP",
    icon = glyph "dev_php",
    color = "#777BB4",
    aliases = { "composer" },
  },
  pnpm = {
    name = "pnpm",
    icon = glyph("md_package_variant_closed", glyph "dev_npm"),
    color = "#F69220",
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
  redis = {
    name = "Redis",
    icon = glyph "dev_redis",
    color = "#DC382D",
  },
  rg = {
    name = "ripgrep",
    icon = glyph "md_magnify",
    color = "#F5A97F",
    aliases = { "ripgrep" },
  },
  rust = {
    name = "Rust",
    icon = glyph "dev_rust",
    color = "#DEA584",
    aliases = { "rustc", "rustup" },
  },
  ruby = {
    name = "Ruby",
    icon = glyph "cod_ruby",
    color = "#CC342D",
  },
  sass = {
    name = "Sass",
    icon = glyph "dev_sass",
    color = "#CC6699",
    aliases = { "scss" },
  },
  sqlite = {
    name = "SQLite",
    icon = glyph "dev_sqllite",
    color = "#003B57",
    aliases = { "sqlite3" },
  },
  ssh = {
    name = "SSH",
    icon = glyph "md_ssh",
    color = "#A6E3A1",
  },
  sudo = {
    name = "sudo",
    icon = glyph "fa_hashtag",
    color = "#E95420",
  },
  terraform = {
    name = "Terraform",
    icon = glyph("md_terraform", glyph "dev_code"),
    color = "#844FBA",
    aliases = { "tofu", "opentofu" },
  },
  topgrade = {
    name = "Topgrade",
    icon = glyph "md_rocket_launch",
    color = "#7AA2F7",
  },
  typescript = {
    name = "TypeScript",
    icon = glyph("seti_typescript", glyph "dev_javascript"),
    color = "#3178C6",
    aliases = { "ts" },
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
    aliases = { "code", "code.exe" },
  },
  wezterm = {
    name = "WezTerm",
    icon = glyph "cod_terminal",
    color = "#7AA2F7",
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
  yarn = {
    name = "Yarn",
    icon = glyph("seti_yarn", glyph "dev_npm"),
    color = "#2C8EBB",
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
