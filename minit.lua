---Minimal config for bug reports. Run it in isolation from your own config:
---
---    wezterm --config-file minit.lua
---
---Put your reproduction below the marker. Keep it as small as possible and
---paste the edited file into the bug report.
local wezterm = require "wezterm"
local sigil = wezterm.plugin.require "https://github.com/sravioli/sigil.wz"
local config = wezterm.config_builder()

-- Edit below this line --------------------------------------------------------

wezterm.on("update-status", function(window)
  window:set_right_status(sigil.format "nvim")
end)

return config
