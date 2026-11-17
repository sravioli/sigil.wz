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

---@class Sigil.ConfigModule
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

---Log invalid fields and drop them so one typo never discards the rest.
---@param opts table
---@return table
local function sanitize(opts)
  if opts.validate == false then
    return opts
  end
  schema = schema or build_schema()
  local work = tbl.deepcopy(opts)
  local result = schema:safe_parse(work, { drop_invalid = true })
  if #(result.dropped or {}) > 0 or #result.issues > 0 or #result.warnings > 0 then
    result:log()
  end
  -- An older warden without drop_invalid returns no `input`.
  return result.input or work
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
