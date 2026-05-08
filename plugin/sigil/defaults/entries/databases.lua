---@module "sigil.defaults.entries.databases"

local glyph = require "sigil.defaults.glyph"

---@type table<string, Sigil.Entry>
return {
  mariadb = {
    name = "MariaDB",
    icon = glyph "dev_mysql",
    color = "#003545",
  },
  mongo = {
    name = "MongoDB",
    icon = glyph "dev_mongodb",
    color = "#47A248",
    aliases = { "mongosh", "mongodb" },
  },
  mysql = {
    name = "MySQL",
    icon = glyph "dev_mysql",
    color = "#4479A1",
  },
  psql = {
    name = "PostgreSQL",
    icon = glyph "dev_postgresql",
    color = "#4169E1",
  },
  redis = {
    name = "Redis",
    icon = glyph "dev_redis",
    color = "#DC382D",
  },
  sqlite = {
    name = "SQLite",
    icon = glyph "dev_sqllite",
    color = "#003B57",
    aliases = { "sqlite3" },
  },
}
