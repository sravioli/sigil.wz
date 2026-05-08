--- Minimal wezterm mock for testing outside WezTerm.
--- Loaded before any test file via `helper` or package preloading.

-- Return the existing mock if already installed (idempotent).
if package.loaded["wezterm"] then
  return package.loaded["wezterm"]
end

local M = {}

-- Capture calls for assertion
M._calls = {}

local function record(name)
  return function(...)
    table.insert(M._calls, { fn = name, args = { ... } })
  end
end

M.log_info = record "log_info"
M.log_warn = record "log_warn"
M.log_error = record "log_error"

M.format = function(items)
  table.insert(M._calls, { fn = "format", args = { items } })
  return "<formatted>"
end

M.nerdfonts = setmetatable({}, {
  __index = function(_, key)
    return "nf:" .. key
  end,
})

-- wezterm.to_string – use tostring fallback
function M.to_string(v)
  return tostring(v)
end

-- wezterm.serde stub
M.serde = {
  json_encode = function(value)
    -- Minimal JSON encoder for flat tables
    if type(value) == "string" then
      return '"' .. value:gsub('"', '\\"') .. '"'
    end
    if type(value) == "number" or type(value) == "boolean" then
      return tostring(value)
    end
    if type(value) == "nil" then
      return "null"
    end
    if type(value) == "table" then
      local parts = {}
      for k, v in pairs(value) do
        local kk = '"' .. tostring(k) .. '"'
        local vv = M.serde.json_encode(v)
        parts[#parts + 1] = kk .. ":" .. vv
      end
      return "{" .. table.concat(parts, ",") .. "}"
    end
    return tostring(value)
  end,
  json_decode = function(_)
    -- Intentionally minimal: not used in hot paths during tests.
    -- You can extend if needed.
    return {}
  end,
}

-- wezterm.time stub
M.time = {
  now = function()
    local ts = os.time()
    return setmetatable({}, {
      __index = {
        format = function(_, fmt)
          if fmt == "%s" then
            return tostring(ts)
          end
          return os.date(fmt:gsub("%%.3f", ".000"), ts)
        end,
      },
    })
  end,
}

-- wezterm.config_dir stub — deliberately NOT a temp dir, so
-- that file-sink tests writing to %TEMP% are not relocated.
-- selene: allow(incorrect_standard_library_use)
local sep = package.config:sub(1, 1)
M.config_dir = sep == "\\" and "C:\\wezterm_mock_config_dir" or "/wezterm_mock_config_dir"

-- wezterm.GLOBAL stub — survives config reloads, wiped on process exit.
M.GLOBAL = {}

-- wezterm.plugin stub
M.plugin = {
  list = function()
    return {}
  end,
}

-- Reset captured calls and GLOBAL state
function M._reset()
  M._calls = {}
  M.GLOBAL = {}
end

-- Install the mock into package.loaded so require("wezterm") returns this.
package.loaded["wezterm"] = M

return M
