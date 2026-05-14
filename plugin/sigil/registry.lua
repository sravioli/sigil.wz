---@module "sigil.registry"

local deps = require "sigil.deps"
local filesystem = deps.warp.filesystem
local str = deps.warp.string
local tbl = deps.warp.table

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
  return filesystem.basename(value)
end

---@param key any
---@return string
function M.normalize(key)
  key = str.trim(tostring(key or ""))
  key = basename(key)
  return key:lower()
end

---@param key string
---@param entry Sigil.Entry
function M.add(key, entry)
  local normalized = M.normalize(key)
  local copy = tbl.deepcopy(entry)
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
      M.add(key, tbl.merge("force", tbl.deepcopy(base), tbl.deepcopy(override or {})))
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

  return tbl.deepcopy(entry)
end

---@return table<string, Sigil.Entry>
function M.all()
  return tbl.deepcopy(M.entries)
end

return M
