---@module "sigil.defaults.entries.runtimes"

local glyph = require "sigil.defaults.glyph"

---@type table<string, Sigil.Entry>
return {
  bun = {
    name = "Bun",
    icon = glyph("seti_javascript", glyph "dev_javascript"),
    color = "#F9F1E1",
    aliases = { "bunx" },
  },
  deno = {
    name = "Deno",
    icon = glyph("seti_javascript", glyph "dev_javascript"),
    color = "#000000",
  },
  node = {
    name = "Node.js",
    icon = glyph "md_nodejs",
    color = "#339933",
    aliases = { "node.exe", "nodejs" },
  },
}
