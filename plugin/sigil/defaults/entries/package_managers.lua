---@module "sigil.defaults.entries.package_managers"

local glyph = require "sigil.defaults.glyph"

---@type table<string, Sigil.Entry>
return {
  cargo = {
    name = "Cargo",
    icon = glyph "dev_rust",
    color = "#DEA584",
  },
  composer = {
    name = "Composer",
    icon = glyph "dev_composer",
    color = "#885630",
  },
  gem = {
    name = "RubyGems",
    icon = glyph "cod_ruby",
    color = "#E9573F",
    aliases = { "bundle", "bundler" },
  },
  gofmt = {
    name = "gofmt",
    icon = glyph "seti_go",
    color = "#00ADD8",
  },
  gradle = {
    name = "Gradle",
    icon = glyph("seti_gradle", glyph "dev_java"),
    color = "#02303A",
  },
  make = {
    name = "Make",
    icon = glyph "seti_makefile",
    color = "#427819",
  },
  npm = {
    name = "npm",
    icon = glyph "dev_npm",
    color = "#CB3837",
    aliases = { "npx" },
  },
  pacman = {
    name = "Pacman",
    icon = glyph("linux_archlinux", "A"),
    color = "#1793D1",
    aliases = { "paru" },
  },
  pip = {
    name = "pip",
    icon = glyph "seti_python",
    color = "#3776AB",
    aliases = { "pip3" },
  },
  pnpm = {
    name = "pnpm",
    icon = glyph("md_package_variant_closed", glyph "dev_npm"),
    color = "#F69220",
  },
  poetry = {
    name = "Poetry",
    icon = glyph "seti_python",
    color = "#60A5FA",
  },
  uv = {
    name = "uv",
    icon = glyph "seti_python",
    color = "#DE5FE9",
  },
  yarn = {
    name = "Yarn",
    icon = glyph("seti_yarn", glyph "dev_npm"),
    color = "#2C8EBB",
  },
}
