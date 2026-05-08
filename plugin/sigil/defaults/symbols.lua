---@module "sigil.defaults.symbols"

local glyph = require "sigil.defaults.glyph"

return {
  Notification = glyph "cod_circle_small_filled",
  Workspace = glyph "cod_briefcase",
  Folder = glyph "md_folder",
  Hostname = glyph "md_monitor_shimmer",
  Leader = glyph "md_lightning_bolt",
  Ellipsis = glyph "fa_ellipsis",

  Modes = {
    copy = glyph "md_content_copy",
    search = glyph "md_magnify",
    font = glyph "md_format_font",
    window = glyph "md_dock_window",
    help = glyph "md_help_box",
    lantern = glyph("md_flashlight", glyph "md_pickaxe"),
  },

  Lantern = {
    ico = glyph("md_flashlight", glyph "md_pickaxe"),
    fuzzy = {
      ico = glyph "cod_search_fuzzy",
      punct = "❭",
    },
    exact = {
      ico = glyph "cod_search",
      punct = ":",
    },
  },

  Sep = {
    block = "█",
    sb = {
      left = glyph "pl_left_hard_divider",
      right = glyph "pl_right_hard_divider",
      modal = glyph "ple_forwardslash_separator",
    },
    ws = {
      left = glyph "ple_right_half_circle_thick",
      right = glyph "ple_left_half_circle_thick",
    },
    tb = {
      leftmost = "▐",
      left = glyph "ple_upper_right_triangle",
      right = glyph "ple_lower_left_triangle",
    },
    leader = {
      right = glyph "ple_left_half_circle_thick",
      left = glyph "ple_right_half_circle_thick",
    },
  },

  Bat = {
    Full = {
      ["100"] = glyph "md_battery",
    },
    Charging = {
      ["00"] = glyph "md_battery_alert",
      ["10"] = glyph "md_battery_charging_10",
      ["20"] = glyph "md_battery_charging_20",
      ["30"] = glyph "md_battery_charging_30",
      ["40"] = glyph "md_battery_charging_40",
      ["50"] = glyph "md_battery_charging_50",
      ["60"] = glyph "md_battery_charging_60",
      ["70"] = glyph "md_battery_charging_70",
      ["80"] = glyph "md_battery_charging_80",
      ["90"] = glyph "md_battery_charging_90",
      ["100"] = glyph "md_battery_charging_100",
    },
    Discharging = {
      ["00"] = glyph "md_battery_outline",
      ["10"] = glyph "md_battery_10",
      ["20"] = glyph "md_battery_20",
      ["30"] = glyph "md_battery_30",
      ["40"] = glyph "md_battery_40",
      ["50"] = glyph "md_battery_50",
      ["60"] = glyph "md_battery_60",
      ["70"] = glyph "md_battery_70",
      ["80"] = glyph "md_battery_80",
      ["90"] = glyph "md_battery_90",
      ["100"] = glyph "md_battery",
    },
  },

  Nums = {
    glyph "md_numeric_1",
    glyph "md_numeric_2",
    glyph "md_numeric_3",
    glyph "md_numeric_4",
    glyph "md_numeric_5",
    glyph "md_numeric_6",
    glyph "md_numeric_7",
    glyph "md_numeric_8",
    glyph "md_numeric_9",
    glyph "md_numeric_10",
  },

  Clock = {
    night = {
      ["00"] = glyph "md_clock_time_twelve",
      ["01"] = glyph "md_clock_time_one",
      ["02"] = glyph "md_clock_time_two",
      ["03"] = glyph "md_clock_time_three",
      ["04"] = glyph "md_clock_time_four",
      ["05"] = glyph "md_clock_time_five",
      ["06"] = glyph "md_clock_time_six",
      ["07"] = glyph "md_clock_time_seven",
      ["08"] = glyph "md_clock_time_eight",
      ["09"] = glyph "md_clock_time_nine",
      ["10"] = glyph "md_clock_time_ten",
      ["11"] = glyph "md_clock_time_eleven",
      ["12"] = glyph "md_clock_time_twelve",
    },
    day = {
      ["00"] = glyph "md_clock_time_twelve_outline",
      ["01"] = glyph "md_clock_time_one_outline",
      ["02"] = glyph "md_clock_time_two_outline",
      ["03"] = glyph "md_clock_time_three_outline",
      ["04"] = glyph "md_clock_time_four_outline",
      ["05"] = glyph "md_clock_time_five_outline",
      ["06"] = glyph "md_clock_time_six_outline",
      ["07"] = glyph "md_clock_time_seven_outline",
      ["08"] = glyph "md_clock_time_eight_outline",
      ["09"] = glyph "md_clock_time_nine_outline",
      ["10"] = glyph "md_clock_time_ten_outline",
      ["11"] = glyph "md_clock_time_eleven_outline",
      ["12"] = glyph "md_clock_time_twelve_outline",
    },
  },
}
