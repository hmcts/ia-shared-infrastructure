locals {

  destroy_me = "${var.env == "preview" || var.env == "spreview" ? "Yes" : var.destroy_me}"

  common_tags = {
    "environment"  = "${var.env}"
    "Team Name"    = "${var.team_name}"
    "Team Contact" = "${var.team_contact}"
    "Destroy Me"   = "${local.destroy_me}"
  }
}
