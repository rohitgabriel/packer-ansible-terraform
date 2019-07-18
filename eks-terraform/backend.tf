terraform {
  backend "remote" {
    organization = "eit-demo"

    workspaces {
      name = "gitlab-server-workspace"
    }
  }
}
