---@module "sigil.core"

local config = require "sigil.config"
local defaults = require "sigil.defaults"
local registry = require "sigil.registry"
local tbl = require("sigil.deps").warp.table
local wezterm = require "wezterm" --[[@as Wezterm]]

local M = {
  initialized = false,
}

---@param path string
---@param source table
---@return any
local function get_path(path, source)
  local current = source
  for part in path:gmatch "[^.]+" do
    if type(current) ~= "table" then
      return nil
    end
    current = current[part]
  end
  return current
end

---@param key any
---@return Sigil.Entry
local function fallback_entry(key)
  local fallback = config.get().fallback
  return {
    key = registry.normalize(key),
    name = fallback.name,
    icon = fallback.icon,
    color = fallback.color,
  }
end

local function ensure()
  if M.initialized then
    return
  end

  local cfg = config.get()
  registry.reset(defaults.entries, cfg.overrides)
  M.initialized = true
end

---Configure Sigil.
---@param opts? table
---@return Sigil.Config
function M.setup(opts)
  local cfg = config.setup(opts)
  registry.reset(defaults.entries, cfg.overrides)
  M.initialized = true
  return cfg
end

---Register or replace a Sigil entry.
---@param key string
---@param entry Sigil.Entry
---@return Sigil.Entry
function M.add(key, entry)
  ensure()
  registry.add(key, entry)
  return registry.get(key)
end

---Return a Sigil entry by key or alias.
---@param key any
---@param opts? { fallback: boolean }
---@return Sigil.Entry|nil
function M.get(key, opts)
  ensure()
  local entry = registry.get(key)

  if entry then
    return entry
  end

  local fallback = opts and opts.fallback
  if fallback == nil then
    fallback = config.get().fallback.enabled
  end

  if fallback then
    return fallback_entry(key)
  end

  return nil
end

---Return only the icon for a key or alias.
---@param key any
---@param opts? { fallback: boolean }
---@return string|nil
function M.icon(key, opts)
  local entry = M.get(key, opts)
  return entry and entry.icon or nil
end

---Return only the color for a key or alias.
---@param key any
---@param opts? { fallback: boolean }
---@return string|nil
function M.color(key, opts)
  local entry = M.get(key, opts)
  return entry and entry.color or nil
end

---Return raw `wezterm.format` items for a key or alias.
---@param key any
---@param opts? { fallback: boolean, padding: false|"left"|"right"|"both"|boolean, reset: boolean }
---@return table
function M.items(key, opts)
  local entry = M.get(key, opts)
  if not entry then
    return {}
  end

  local cfg = config.get()
  local padding = opts and opts.padding
  local reset = opts and opts.reset
  if padding == nil then
    padding = cfg.formatting.padding
  end
  if reset == nil then
    reset = cfg.formatting.reset
  end

  local text = entry.icon
  if padding == true or padding == "both" then
    text = " " .. text .. " "
  elseif padding == "left" then
    text = " " .. text
  elseif padding == "right" then
    text = text .. " "
  end

  local items = {}
  if entry.color then
    items[#items + 1] = { Foreground = { Color = entry.color } }
  end
  items[#items + 1] = { Text = text }
  if reset then
    items[#items + 1] = "ResetAttributes"
  end
  return items
end

---Render a key or alias with `wezterm.format`.
---@param key any
---@param opts? table
---@return string
function M.format(key, opts)
  return wezterm.format(M.items(key, opts))
end

---Return a symbol by dotted path, such as `Sep.tb.left`.
---@param path string
---@return any
function M.symbol(path)
  local symbols =
    tbl.merge("force", tbl.deepcopy(defaults.symbols), tbl.deepcopy(config.get().symbols or {}))
  return get_path(path, symbols)
end

---Return all configured symbols.
---@return table
function M.symbols()
  return tbl.merge(
    "force",
    tbl.deepcopy(defaults.symbols),
    tbl.deepcopy(config.get().symbols or {})
  )
end

---Return all registered entries.
---@return table<string, Sigil.Entry>
function M.all()
  ensure()
  return registry.all()
end

return M
