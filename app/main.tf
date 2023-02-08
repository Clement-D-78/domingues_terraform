provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA5HPA5JMV2N7WDGQP"
  secret_key = "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"
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-clement"
    key    = "clement.tfstate"
    region = "us-east-1"
    access_key = "AKIA5HPA5JMV2N7WDGQP"
    secret_key = "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"
  }
}

module "ec2" {
  source = "../modules/ec2module"
  instancetype = "t2.nano"
  aws_common_tag = {
    Name = "ec2-dev-clement"
  }
  sg_name = "dev-clement-sg"
}

