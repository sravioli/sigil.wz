---@module "sigil.defaults.entries.os"

local glyph = require "sigil.defaults.glyph"

---@type table<string, Sigil.Entry>
return {
  almalinux = {
    name = "AlmaLinux",
    icon = glyph "linux_almalinux",
    color = "#FF4649",
  },
  alpine = {
    name = "Alpine Linux",
    icon = glyph "linux_alpine",
    color = "#0D597F",
  },
  android = {
    name = "Android",
    icon = glyph "md_android",
    color = "#3DDC84",
  },
  archlinux = {
    name = "Arch Linux",
    icon = glyph "linux_archlinux",
    color = "#1793D1",
  },
  artix = {
    name = "Artix Linux",
    icon = glyph "linux_artix",
    color = "#10A0CC",
  },
  centos = {
    name = "CentOS",
    icon = glyph "linux_centos",
    color = "#262577",
  },
  debian = {
    name = "Debian",
    icon = glyph "linux_debian",
    color = "#A81D33",
  },
  deepin = {
    name = "deepin",
    icon = glyph "linux_deepin",
    color = "#2CA7F8",
  },
  elementary = {
    name = "elementary OS",
    icon = glyph "linux_elementary",
    color = "#64BAFF",
  },
  endeavouros = {
    name = "EndeavourOS",
    icon = glyph "linux_endeavour",
    color = "#7F7FFF",
  },
  fedora = {
    name = "Fedora",
    icon = glyph "linux_fedora",
    color = "#51A2DA",
  },
  freebsd = {
    name = "FreeBSD",
    icon = glyph "linux_freebsd",
    color = "#AB2B28",
  },
  garuda = {
    name = "Garuda Linux",
    icon = glyph "linux_garuda",
    color = "#89B4FA",
  },
  gentoo = {
    name = "Gentoo",
    icon = glyph "linux_gentoo",
    color = "#54487A",
  },
  kali = {
    name = "Kali Linux",
    icon = glyph "linux_kali_linux",
    color = "#557C94",
  },
  linux = {
    name = "Linux",
    icon = glyph "linux_tux",
    color = "#FCC624",
  },
  linuxmint = {
    name = "Linux Mint",
    icon = glyph "linux_linuxmint",
    color = "#87CF3E",
    aliases = { "mint" },
  },
  macos = {
    name = "macOS",
    icon = glyph "linux_apple",
    color = "#A2AAAD",
    aliases = { "darwin", "osx" },
  },
  manjaro = {
    name = "Manjaro",
    icon = glyph "linux_manjaro",
    color = "#35BF5C",
  },
  nixos = {
    name = "NixOS",
    icon = glyph "linux_nixos",
    color = "#5277C3",
    aliases = { "nix" },
  },
  openbsd = {
    name = "OpenBSD",
    icon = glyph "linux_openbsd",
    color = "#F2CA30",
  },
  opensuse = {
    name = "openSUSE",
    icon = glyph "linux_opensuse",
    color = "#73BA25",
    aliases = { "suse" },
  },
  pop_os = {
    name = "Pop!_OS",
    icon = glyph "linux_pop_os",
    color = "#48B9C7",
    aliases = { "pop" },
  },
  raspberry_pi = {
    name = "Raspberry Pi OS",
    icon = glyph "linux_raspberry_pi",
    color = "#C51A4A",
    aliases = { "raspbian" },
  },
  redhat = {
    name = "Red Hat",
    icon = glyph "linux_redhat",
    color = "#EE0000",
    aliases = { "rhel" },
  },
  rocky = {
    name = "Rocky Linux",
    icon = glyph "linux_rocky_linux",
    color = "#10B981",
  },
  slackware = {
    name = "Slackware",
    icon = glyph "linux_slackware",
    color = "#000000",
  },
  solus = {
    name = "Solus",
    icon = glyph "linux_solus",
    color = "#5294E2",
  },
  ubuntu = {
    name = "Ubuntu",
    icon = glyph "linux_ubuntu",
    color = "#E95420",
  },
  void = {
    name = "Void Linux",
    icon = glyph "linux_void",
    color = "#478061",
  },
  windows = {
    name = "Windows",
    icon = glyph "md_microsoft_windows",
    color = "#0078D6",
    aliases = { "win32" },
  },
  zorin = {
    name = "Zorin OS",
    icon = glyph "linux_zorin",
    color = "#15A6F0",
  },
}
