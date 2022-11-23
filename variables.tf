variable "AWS_REGION" {
    default = "us-west-2"
}

variable "AMI" {
    type = map(string)

    default = {
        us-west-2 = "ami-0d593311db5abb72b"
        us-east-1 = "ami-0c2a1acae6667e438"
    }
}

variable "PUBLIC_KEY_PATH" {
    default = "/Users/praveensingampalli/Documents/BOOTCAMP2_FINAL/Terraform_learning_demo/Terraform_learning_demo/oregon-region-key-pair.pub"
}