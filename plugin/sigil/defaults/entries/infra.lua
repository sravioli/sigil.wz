---@module "sigil.defaults.entries.infra"

local glyph = require "sigil.defaults.glyph"

---@type table<string, Sigil.Entry>
return {
  ansible = {
    name = "Ansible",
    icon = glyph "dev_ansible",
    color = "#EE0000",
  },
  aws = {
    name = "AWS",
    icon = glyph "dev_aws",
    color = "#FF9900",
    aliases = { "aws-vault" },
  },
  azure = {
    name = "Azure",
    icon = glyph "dev_azure",
    color = "#0078D4",
    aliases = { "az" },
  },
  docker = {
    name = "Docker",
    icon = glyph "linux_docker",
    color = "#2496ED",
    aliases = { "docker-compose", "lazydocker", "podman" },
  },
  gcloud = {
    name = "Google Cloud",
    icon = glyph "dev_googlecloud",
    color = "#4285F4",
    aliases = { "google-cloud" },
  },
  helm = {
    name = "Helm",
    icon = glyph "dev_helm",
    color = "#0F1689",
  },
  kubectl = {
    name = "Kubernetes",
    icon = glyph("dev_kubernetes", glyph "linux_docker"),
    color = "#326CE5",
    aliases = { "kuberlr", "k9s", "kubernetes" },
  },
  nginx = {
    name = "NGINX",
    icon = glyph "dev_nginx",
    color = "#009639",
  },
  terraform = {
    name = "Terraform",
    icon = glyph("md_terraform", glyph "cod_code"),
    color = "#844FBA",
    aliases = { "tofu", "opentofu" },
  },
  vagrant = {
    name = "Vagrant",
    icon = glyph "dev_vagrant",
    color = "#1868F2",
  },
}
