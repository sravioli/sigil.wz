---@module "sigil.defaults.entries"

local categories = {
  (require "sigil.defaults.entries.terminals"),
  (require "sigil.defaults.entries.editors"),
  (require "sigil.defaults.entries.languages"),
  (require "sigil.defaults.entries.runtimes"),
  (require "sigil.defaults.entries.package_managers"),
  (require "sigil.defaults.entries.databases"),
  (require "sigil.defaults.entries.infra"),
  (require "sigil.defaults.entries.tools"),
  (require "sigil.defaults.entries.os"),
  (require "sigil.defaults.entries.apps"),
}

local M = {}

for _, entries in ipairs(categories) do
  for key, entry in pairs(entries) do
    M[key] = entry
  end
end

return M
