---@module "sigil.deps"

local wezterm = require "wezterm"

local M = {}

local function require_plugin(module, url)
  local ok, plugin = pcall(require, module)
  if ok and plugin then
    return plugin
  end

  ok, plugin = pcall(wezterm.plugin.require, url)
  if ok and plugin then
    return plugin
  end

  error(("[sigil] unable to load dependency %s: %s"):format(url, tostring(plugin)))
end

M.warp = require_plugin("warp.api", "https://github.com/sravioli/warp.wz")

return M
