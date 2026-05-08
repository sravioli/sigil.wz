---@module "sigil.api"

local config = require "sigil.config"
local core = require "sigil.core"

---@class Sigil.Api
---@field config table
local M = {
  config = config,
}

M.setup = core.setup
M.add = core.add
M.get = core.get
M.icon = core.icon
M.color = core.color
M.items = core.items
M.format = core.format
M.symbol = core.symbol
M.symbols = core.symbols
M.all = core.all

return M
