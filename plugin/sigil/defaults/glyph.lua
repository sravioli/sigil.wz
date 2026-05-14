---@module "sigil.defaults.glyph"

local wezterm = require "wezterm" --[[@as Wezterm]]
local nf = wezterm.nerdfonts or {}

---@param name string Nerd Font key exposed by WezTerm.
---@param fallback? string Text to use when the glyph is unavailable.
---@return string glyph Resolved glyph or fallback text.
return function(name, fallback)
  return nf[name] or fallback or "?"
end
