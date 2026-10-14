---@class Wezterm
local wezterm = require "wezterm" --[[@as Wezterm]]
local module_name = ...

---Locate this plugin_dir and add it to package.path.
---@return nil
local function bootstrap(refresh)
  -- selene: allow(incorrect_standard_library_use)
  local sep = package.config:sub(1, 1)

  local plugins = not refresh and wezterm.plugin._bootstrap_plugins
  if not plugins then
    plugins = wezterm.plugin.list()
    wezterm.plugin._bootstrap_plugins = plugins
  end
  for _, p in ipairs(plugins) do
    if
      (module_name and p.component == module_name)
      or (not module_name and p.url:find("sigil.wz", 1, true))
    then
      local base = p.plugin_dir .. sep .. "plugin" .. sep
      local entries = {
        base .. "?.lua",
        base .. "?" .. sep .. "init.lua",
      }
      for _, entry in ipairs(entries) do
        if not package.path:find(entry, 1, true) then
          package.path = package.path .. ";" .. entry
        end
      end
      return p
    end
  end
  if not refresh then
    return bootstrap(true)
  end
  error "Installed plugin not found: sigil.wz"
end

bootstrap()

return require "sigil.api"
