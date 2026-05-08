---@module "sigil.defaults.glyph"

local wezterm = require "wezterm" --[[@as Wezterm]]
local nf = wezterm.nerdfonts or {}

---@param name string
---@param fallback? string
---@return string
return function(name, fallback)
  return nf[name] or fallback or "?"
end
