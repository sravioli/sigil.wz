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
  bitbucket = {
    name = "Bitbucket",
    icon = glyph "dev_bitbucket",
    color = "#0052CC",
  },
  cloudflare = {
    name = "Cloudflare",
    icon = glyph "dev_cloudflare",
    color = "#F38020",
  },
  consul = {
    name = "Consul",
    icon = glyph "dev_consul",
    color = "#CA2171",
  },
  digitalocean = {
    name = "DigitalOcean",
    icon = glyph "dev_digitalocean",
    color = "#0080FF",
    aliases = { "doctl" },
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
  gitlab = {
    name = "GitLab",
    icon = glyph "dev_gitlab",
    color = "#FC6D26",
  },
  grafana = {
    name = "Grafana",
    icon = glyph "dev_grafana",
    color = "#F46800",
  },
  helm = {
    name = "Helm",
    icon = glyph "dev_helm",
    color = "#0F1689",
  },
  heroku = {
    name = "Heroku",
    icon = glyph "dev_heroku",
    color = "#430098",
  },
  jenkins = {
    name = "Jenkins",
    icon = glyph "dev_jenkins",
    color = "#D24939",
  },
  jira = {
    name = "Jira",
    icon = glyph "dev_jira",
    color = "#0052CC",
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
  nomad = {
    name = "Nomad",
    icon = glyph "dev_nomad",
    color = "#00CA8E",
  },
  packer = {
    name = "Packer",
    icon = glyph "dev_packer",
    color = "#02A8EF",
  },
  prometheus = {
    name = "Prometheus",
    icon = glyph "dev_prometheus",
    color = "#E6522C",
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
  vault = {
    name = "Vault",
    icon = glyph "dev_vault",
    color = "#FFD814",
  },
}
