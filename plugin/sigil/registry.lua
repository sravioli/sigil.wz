---@module "sigil.registry"

local config = require "sigil.config"

---@class Sigil.Entry
---@field key? string
---@field name? string
---@field icon string
---@field color? string
---@field aliases? string[]

local M = {
  entries = {},
  aliases = {},
}

---@param value string
---@return string
local function basename(value)
  local normalized = value:gsub("/", "\\")
  return normalized:match "([^\\]+)$" or normalized
end

---@param key any
---@return string
function M.normalize(key)
  key = tostring(key or "")
  key = key:match "^%s*(.-)%s*$"
  key = basename(key)
  return key:lower()
end

---@param key string
---@param entry Sigil.Entry
function M.add(key, entry)
  local normalized = M.normalize(key)
  local copy = config.deepcopy(entry)
  copy.key = copy.key or normalized
  M.entries[normalized] = copy
  M.aliases[normalized] = normalized

  if type(copy.aliases) == "table" then
    for _, alias in ipairs(copy.aliases) do
      M.aliases[M.normalize(alias)] = normalized
    end
  end
end

---@param entries table<string, Sigil.Entry>
---@param overrides? table<string, Sigil.Entry>
function M.reset(entries, overrides)
  M.entries = {}
  M.aliases = {}

  for key, entry in pairs(entries) do
    M.add(key, entry)
  end

  if type(overrides) == "table" then
    for key, override in pairs(overrides) do
      local normalized = M.normalize(key)
      local base = M.entries[M.aliases[normalized] or normalized] or {}
      M.add(key, config.merge(config.deepcopy(base), override))
    end
  end
end

---@param key any
---@return Sigil.Entry|nil
function M.get(key)
  local normalized = M.normalize(key)
  local canonical = M.aliases[normalized] or normalized
  local entry = M.entries[canonical]

  if not entry then
    return nil
  end

  return config.deepcopy(entry)
end

---@return table<string, Sigil.Entry>
function M.all()
  return config.deepcopy(M.entries)
end

return M
