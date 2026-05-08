---@module "sigil.defaults.entries.languages"

local glyph = require "sigil.defaults.glyph"

---@type table<string, Sigil.Entry>
return {
  clang = {
    name = "Clang",
    icon = glyph "dev_c",
    color = "#A8B9CC",
  },
  crystal = {
    name = "Crystal",
    icon = glyph "seti_crystal",
    color = "#000000",
  },
  clojure = {
    name = "Clojure",
    icon = glyph "dev_clojure",
    color = "#5881D8",
    aliases = { "clj", "clojurescript", "cljs" },
  },
  cpp = {
    name = "C++",
    icon = glyph "custom_cpp",
    color = "#00599C",
    aliases = { "cplusplus" },
  },
  css = {
    name = "CSS",
    icon = glyph "dev_css3",
    color = "#1572B6",
    aliases = { "css3" },
  },
  dart = {
    name = "Dart",
    icon = glyph "dev_dart",
    color = "#0175C2",
  },
  dotnet = {
    name = ".NET",
    icon = glyph "dev_dotnet",
    color = "#512BD4",
    aliases = { "csharp", "c#", "fsharp", "f#" },
  },
  elixir = {
    name = "Elixir",
    icon = glyph "dev_elixir",
    color = "#4B275F",
    aliases = { "iex", "mix" },
  },
  erlang = {
    name = "Erlang",
    icon = glyph "dev_erlang",
    color = "#A90533",
    aliases = { "erl" },
  },
  gcc = {
    name = "GCC",
    icon = glyph "dev_gnu",
    color = "#A42E2B",
    aliases = { "cc", "g++", "c++" },
  },
  go = {
    name = "Go",
    icon = glyph "seti_go",
    color = "#00ADD8",
  },
  haskell = {
    name = "Haskell",
    icon = glyph "dev_haskell",
    color = "#5D4F85",
    aliases = { "ghc", "ghci" },
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
  json = {
    name = "JSON",
    icon = glyph "seti_json",
    color = "#F7DF1E",
  },
  julia = {
    name = "Julia",
    icon = glyph "dev_julia",
    color = "#9558B2",
  },
  kotlin = {
    name = "Kotlin",
    icon = glyph "seti_kotlin",
    color = "#7F52FF",
    aliases = { "kotlinc" },
  },
  lua = {
    name = "Lua",
    icon = glyph "seti_lua",
    color = "#2C2D72",
  },
  markdown = {
    name = "Markdown",
    icon = glyph "dev_markdown",
    color = "#083FA1",
    aliases = { "md" },
  },
  nim = {
    name = "Nim",
    icon = glyph "dev_nim",
    color = "#FFE953",
  },
  ocaml = {
    name = "OCaml",
    icon = glyph "dev_ocaml",
    color = "#EC6813",
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
  },
  python = {
    name = "Python",
    icon = glyph "seti_python",
    color = "#3776AB",
  },
  r = {
    name = "R",
    icon = glyph "dev_r",
    color = "#276DC3",
    aliases = { "r.exe", "rscript", "rscript.exe" },
  },
  ruby = {
    name = "Ruby",
    icon = glyph "cod_ruby",
    color = "#CC342D",
  },
  rust = {
    name = "Rust",
    icon = glyph "dev_rust",
    color = "#DEA584",
    aliases = { "rustc", "rustup" },
  },
  sass = {
    name = "Sass",
    icon = glyph "dev_sass",
    color = "#CC6699",
    aliases = { "scss" },
  },
  scala = {
    name = "Scala",
    icon = glyph "dev_scala",
    color = "#DC322F",
  },
  solidity = {
    name = "Solidity",
    icon = glyph "dev_solidity",
    color = "#363636",
    aliases = { "solc" },
  },
  swift = {
    name = "Swift",
    icon = glyph "dev_swift",
    color = "#F05138",
  },
  toml = {
    name = "TOML",
    icon = glyph "custom_toml",
    color = "#9C4221",
  },
  typescript = {
    name = "TypeScript",
    icon = glyph("seti_typescript", glyph "dev_javascript"),
    color = "#3178C6",
    aliases = { "ts" },
  },
  xml = {
    name = "XML",
    icon = glyph "seti_xml",
    color = "#E37933",
  },
  yaml = {
    name = "YAML",
    icon = glyph "dev_yaml",
    color = "#CB171E",
    aliases = { "yml" },
  },
  zig = {
    name = "Zig",
    icon = glyph "seti_zig",
    color = "#F7A41D",
    aliases = { "zigmod" },
  },
}
