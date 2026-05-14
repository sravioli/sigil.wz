---@module "sigil.config"

local tbl = require("sigil.deps").warp.table

---@class Sigil.Config
---@field fallback Sigil.FallbackConfig
---@field formatting Sigil.FormattingConfig
---@field overrides table<string, Sigil.Entry>
---@field symbols table<string, any>

---@class Sigil.FallbackConfig
---@field enabled boolean
---@field icon string
---@field color string
---@field name string

---@class Sigil.FormattingConfig
---@field reset boolean
---@field padding false|"left"|"right"|"both"|boolean

local M = {}

---@type Sigil.Config
local defaults = {
  fallback = {
    enabled = true,
    icon = "?",
    color = "#a6adc8",
    name = "Unknown",
  },

  formatting = {
    reset = true,
    padding = false,
  },

  overrides = {},
  symbols = {},
}

local current

---Configure Sigil.
---@param opts? table
---@return Sigil.Config
function M.setup(opts)
  current = tbl.merge("force", tbl.deepcopy(defaults), tbl.deepcopy(opts or {}))
  return current
end

---Return the active Sigil configuration.
---@return Sigil.Config
function M.get()
  if not current then
    current = tbl.deepcopy(defaults)
  end
  return current
end

---Return a copy of the default configuration.
---@return Sigil.Config
function M.defaults()
  return tbl.deepcopy(defaults)
end

return M
