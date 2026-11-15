---@module "sigil.config"

local deps = require "sigil.deps"
local tbl = deps.warp.table

---@class Sigil.Config
---@field fallback Sigil.FallbackConfig
---@field formatting Sigil.FormattingConfig
---@field overrides table<string, Sigil.Entry>
---@field symbols table<string, any>
---@field validate boolean Set to `false` to skip option validation (and never load warden).

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
  validate = true,
  symbols = {},
}

-- Validates user options only; the merge below still extends the defaults.
local function build_schema()
  local w = deps.warden()
  return w.object({
    fallback = w.object({
      enabled = w.boolean():optional(),
      icon = w.string():optional(),
      color = w.string():optional(),
      name = w.string():optional(),
    })
      :optional()
      :unknown "warn",
    formatting = w.object({
      reset = w.boolean():optional(),
      padding = w.union({ w.boolean(), w.enum { "left", "right", "both" } }):optional(),
    })
      :optional()
      :unknown "warn",
    validate = w.boolean():optional(),
    overrides = w.map(w.string(), w.table()):optional(),
    symbols = w.map(w.string(), w.any()):optional(),
  }):unknown "warn"
end

local schema

---Remove the value at `path` from `t`.
---@param t table
---@param path any[]
---@return boolean removed
local function drop(t, path)
  local node = t
  for i = 1, #path - 1 do
    node = type(node) == "table" and node[path[i]] or nil
  end
  if type(node) ~= "table" or #path == 0 or node[path[#path]] == nil then
    return false
  end
  node[path[#path]] = nil
  return true
end

---Log invalid fields and drop them so one typo never discards the rest.
---@param opts table
---@return table
local function sanitize(opts)
  if opts.validate == false then
    return opts
  end
  schema = schema or build_schema()
  local work = tbl.deepcopy(opts)
  local result = schema:safe_parse(work)
  if #result.issues > 0 or #result.warnings > 0 then
    result:log()
  end
  for _ = 1, 32 do
    local removed = false
    for _, issue in ipairs(result.issues) do
      removed = drop(work, issue.path) or removed
    end
    if result.ok or not removed then
      break
    end
    result = schema:safe_parse(work)
  end
  return work
end

local current

---Configure Sigil. Invalid options are logged and ignored.
---@param opts? table
---@return Sigil.Config
function M.setup(opts)
  if type(opts) ~= "table" then
    opts = {}
  end
  current = tbl.merge("force", tbl.deepcopy(defaults), sanitize(opts))
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
