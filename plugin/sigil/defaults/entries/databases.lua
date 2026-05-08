---@module "sigil.defaults.entries.databases"

local glyph = require "sigil.defaults.glyph"

---@type table<string, Sigil.Entry>
return {
  cassandra = {
    name = "Cassandra",
    icon = glyph "dev_cassandra",
    color = "#1287B1",
  },
  influxdb = {
    name = "InfluxDB",
    icon = glyph "dev_influxdb",
    color = "#22ADF6",
    aliases = { "influx" },
  },
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
  mssql = {
    name = "Microsoft SQL Server",
    icon = glyph "dev_microsoftsqlserver",
    color = "#CC2927",
    aliases = { "sqlcmd", "mssql-cli" },
  },
  mysql = {
    name = "MySQL",
    icon = glyph "dev_mysql",
    color = "#4479A1",
  },
  neo4j = {
    name = "Neo4j",
    icon = glyph "dev_neo4j",
    color = "#4581C3",
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
    icon = glyph "dev_sqlite",
    color = "#003B57",
    aliases = { "sqlite3" },
  },
}
