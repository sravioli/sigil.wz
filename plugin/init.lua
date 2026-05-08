---@class Wezterm
local wezterm = require "wezterm" --[[@as Wezterm]]

---Locate this plugin_dir and add it to package.path.
---@return nil
local function bootstrap()
  -- selene: allow(incorrect_standard_library_use)
  local sep = package.config:sub(1, 1)

  for _, p in ipairs(wezterm.plugin.list()) do
    if p.url:find("sigil.wz", 1, true) then
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
end

bootstrap()

return require "sigil.api"
