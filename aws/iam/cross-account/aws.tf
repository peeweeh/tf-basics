# setup aws provider for main account
provider "aws" {
    alias = "provider"
    region = "${var.aws_region}"
    access_key = "${var.provider_access}"
    secret_key = "${var.provider_secret}"
}

# setup aws provider for main account
provider "aws" {
    alias = "managed"
    region = "${var.aws_region}"
    access_key = "${var.managed_access}"
    secret_key = "${var.managed_secret}"
}