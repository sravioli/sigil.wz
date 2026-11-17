---@module "sigil.defaults.entries.apps"

local glyph = require "sigil.defaults.glyph"

---@type table<string, Sigil.Entry>
return {
  blender = {
    name = "Blender",
    icon = glyph "md_blender_software",
    color = "#F5792A",
  },
  chromium = {
    name = "Chromium",
    icon = glyph "md_google_chrome",
    color = "#4285F4",
    aliases = { "chrome", "google-chrome" },
  },
  discord = {
    name = "Discord",
    icon = glyph "md_discord",
    color = "#5865F2",
  },
  firefox = {
    name = "Firefox",
    icon = glyph "md_firefox",
    color = "#FF7139",
  },
  gimp = {
    name = "GIMP",
    icon = glyph "linux_gimp",
    color = "#5C5543",
  },
  obs = {
    name = "OBS Studio",
    icon = glyph "md_record_rec",
    color = "#302E31",
    aliases = { "obs-studio" },
  },
  slack = {
    name = "Slack",
    icon = glyph "md_slack",
    color = "#4A154B",
  },
  spotify = {
    name = "Spotify",
    icon = glyph "md_spotify",
    color = "#1DB954",
  },
  steam = {
    name = "Steam",
    icon = glyph "md_steam",
    color = "#1B2838",
  },
  thunderbird = {
    name = "Thunderbird",
    icon = glyph "linux_thunderbird",
    color = "#0A84FF",
  },
  vlc = {
    name = "VLC",
    icon = glyph "md_vlc",
    color = "#FF8800",
  },
}
