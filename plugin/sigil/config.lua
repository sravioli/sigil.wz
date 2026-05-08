---@module "sigil.config"

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

---@param value any
---@return boolean
local function is_array(value)
  return type(value) == "table" and (#value > 0 or next(value) == nil)
end

---@param value any
---@return any
local function deepcopy(value)
  if type(value) ~= "table" then
    return value
  end

  local copy = {}
  for key, child in pairs(value) do
    copy[key] = deepcopy(child)
  end
  return copy
end

---@param dst table
---@param src table|nil
---@return table
local function merge(dst, src)
  if type(src) ~= "table" then
    return dst
  end

  for key, value in pairs(src) do
    if type(value) == "table" and type(dst[key]) == "table" and not is_array(value) then
      merge(dst[key], value)
    else
      dst[key] = deepcopy(value)
    end
  end

  return dst
end

---Configure Sigil.
---@param opts? table
---@return Sigil.Config
function M.setup(opts)
  current = merge(deepcopy(defaults), opts)
  return current
end

---Return the active Sigil configuration.
---@return Sigil.Config
function M.get()
  if not current then
    current = deepcopy(defaults)
  end
  return current
end

---Return a copy of the default configuration.
---@return Sigil.Config
function M.defaults()
  return deepcopy(defaults)
end

M.deepcopy = deepcopy
M.merge = merge

return M
