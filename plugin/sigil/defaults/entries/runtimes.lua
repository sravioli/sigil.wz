---@module "sigil.defaults.entries.runtimes"

local glyph = require "sigil.defaults.glyph"

---@type table<string, Sigil.Entry>
return {
  bun = {
    name = "Bun",
    icon = glyph "dev_bun",
    color = "#F9F1E1",
    aliases = { "bunx" },
  },
  deno = {
    name = "Deno",
    icon = glyph "dev_denojs",
    color = "#000000",
  },
  electron = {
    name = "Electron",
    icon = glyph "custom_electron",
    color = "#47848F",
  },
  node = {
    name = "Node.js",
    icon = glyph "md_nodejs",
    color = "#339933",
    aliases = { "node.exe", "nodejs" },
  },
}
