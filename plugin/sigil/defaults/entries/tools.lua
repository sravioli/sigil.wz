---@module "sigil.defaults.entries.tools"

local glyph = require "sigil.defaults.glyph"

---@type table<string, Sigil.Entry>
return {
  aider = {
    name = "aider",
    icon = glyph "md_robot",
    color = "#14B014",
  },
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
    aliases = { "htop", "top" },
  },
  claude = {
    name = "Claude Code",
    icon = glyph "md_star_four_points",
    color = "#D97757",
    aliases = { "claude-code" },
  },
  cmake = {
    name = "CMake",
    icon = glyph "seti_makefile",
    color = "#064F8C",
  },
  codex = {
    name = "Codex",
    icon = glyph "md_robot_outline",
    color = "#10A37F",
  },
  copilot = {
    name = "GitHub Copilot",
    icon = glyph "cod_copilot",
    color = "#6CC644",
    aliases = { "github copilot", "🤖" },
  },
  curl = {
    name = "curl",
    icon = glyph "md_web",
    color = "#073551",
  },
  direnv = {
    name = "direnv",
    icon = glyph "md_folder_key",
    color = "#40B5A4",
  },
  eslint = {
    name = "ESLint",
    icon = glyph "dev_eslint",
    color = "#4B32C3",
  },
  fd = {
    name = "fd",
    icon = glyph "md_file_find",
    color = "#89B4FA",
  },
  ffmpeg = {
    name = "FFmpeg",
    icon = glyph "md_video",
    color = "#007808",
    aliases = { "ffprobe" },
  },
  fzf = {
    name = "fzf",
    icon = glyph "cod_search_fuzzy",
    color = "#40B5A4",
  },
  gdb = {
    name = "GDB",
    icon = glyph "md_bug",
    color = "#A6E3A1",
  },
  gemini = {
    name = "Gemini CLI",
    icon = glyph "md_creation",
    color = "#8E75B2",
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
  glances = {
    name = "Glances",
    icon = glyph "md_gauge",
    color = "#6C7086",
  },
  gpg = {
    name = "GnuPG",
    icon = glyph "md_key",
    color = "#0093DD",
    aliases = { "gpg2", "gpg-agent" },
  },
  grep = {
    name = "grep",
    icon = glyph "md_magnify",
    color = "#A6E3A1",
  },
  jest = {
    name = "Jest",
    icon = glyph "dev_jest",
    color = "#C21325",
  },
  journalctl = {
    name = "journalctl",
    icon = glyph "md_text_box_search",
    color = "#30D475",
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
  lf = {
    name = "lf",
    icon = glyph "md_folder_multiple",
    color = "#89B4FA",
  },
  lldb = {
    name = "LLDB",
    icon = glyph "md_bug_outline",
    color = "#262D3A",
  },
  man = {
    name = "man",
    icon = glyph "md_book_open_page_variant",
    color = "#A6ADC8",
  },
  mc = {
    name = "Midnight Commander",
    icon = glyph "md_folder_multiple",
    color = "#1E66F5",
  },
  meson = {
    name = "Meson",
    icon = glyph "md_hammer_wrench",
    color = "#39207C",
  },
  mosh = {
    name = "Mosh",
    icon = glyph "md_lan_connect",
    color = "#A6E3A1",
  },
  mpv = {
    name = "mpv",
    icon = glyph "md_play_circle",
    color = "#691F69",
  },
  nancy = {
    name = "Nancy",
    icon = glyph "cod_shield",
    color = "#E95420",
  },
  ncdu = {
    name = "ncdu",
    icon = glyph "md_harddisk",
    color = "#CBA6F7",
    aliases = { "gdu", "dust" },
  },
  ninja = {
    name = "Ninja",
    icon = glyph "md_hammer",
    color = "#9E9E9E",
  },
  nnn = {
    name = "nnn",
    icon = glyph "md_folder_multiple",
    color = "#A6E3A1",
  },
  nvtop = {
    name = "nvtop",
    icon = glyph "md_expansion_card",
    color = "#76B900",
  },
  ollama = {
    name = "Ollama",
    icon = glyph "md_head_cog",
    color = "#FFFFFF",
  },
  openssl = {
    name = "OpenSSL",
    icon = glyph "md_certificate",
    color = "#721412",
  },
  ping = {
    name = "ping",
    icon = glyph "md_access_point_network",
    color = "#89DCEB",
  },
  prettier = {
    name = "Prettier",
    icon = glyph "custom_prettier",
    color = "#F7B93E",
  },
  ranger = {
    name = "ranger",
    icon = glyph "md_folder_multiple",
    color = "#F9E2AF",
  },
  rg = {
    name = "ripgrep",
    icon = glyph "md_magnify",
    color = "#F5A97F",
    aliases = { "ripgrep" },
  },
  rollup = {
    name = "Rollup",
    icon = glyph "dev_rollup",
    color = "#EC4A3F",
  },
  rsync = {
    name = "rsync",
    icon = glyph "md_sync",
    color = "#89B4FA",
    aliases = { "scp", "sftp" },
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
  storybook = {
    name = "Storybook",
    icon = glyph "dev_storybook",
    color = "#FF4785",
  },
  sudo = {
    name = "sudo",
    icon = glyph "fa_hashtag",
    color = "#E95420",
  },
  systemctl = {
    name = "systemd",
    icon = glyph "md_cog_outline",
    color = "#30D475",
    aliases = { "systemd" },
  },
  tailwind = {
    name = "Tailwind CSS",
    icon = glyph "dev_tailwindcss",
    color = "#06B6D4",
    aliases = { "tailwindcss" },
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
  vite = {
    name = "Vite",
    icon = glyph "dev_vite",
    color = "#646CFF",
  },
  vitest = {
    name = "Vitest",
    icon = glyph "dev_vitest",
    color = "#6E9F18",
  },
  watch = {
    name = "watch",
    icon = glyph "md_eye",
    color = "#A6E3A1",
  },
  webpack = {
    name = "Webpack",
    icon = glyph "dev_webpack",
    color = "#8DD6F9",
  },
  wget = {
    name = "wget",
    icon = glyph "md_arrow_down_box",
    color = "#1E88E5",
  },
  yazi = {
    name = "Yazi",
    icon = glyph "md_duck",
    color = "#FFCC66",
  },
  ["yt-dlp"] = {
    name = "yt-dlp",
    icon = glyph "md_youtube",
    color = "#FF0000",
    aliases = { "youtube-dl" },
  },
  zip = {
    name = "zip",
    icon = glyph "md_archive_arrow_up",
    color = "#CBA6F7",
  },
}
