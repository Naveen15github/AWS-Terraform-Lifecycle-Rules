terraform {
  backend "s3" {
    bucket        = "my-terraform-state-bucket"
    key           = "lifecycle-demo/terraform.tfstate"
    region        = "us-west-2"   # MUST match bucket region
    use_lockfile  = true         # Modern replacement for DynamoDB locking
    encrypt       = true
  }
}
