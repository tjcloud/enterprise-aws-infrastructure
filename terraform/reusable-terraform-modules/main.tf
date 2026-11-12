module "project_report" {
  source = "./modules/project-report"

  project_name = "enterprise-aws-infrastructure"
  environment  = "testing"
  owner        = "tyler"
}