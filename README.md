Search the AMI ID in the AWS and add it in the variables.tf
PUBLIC_KEY_PATH ADD FULL PATH IN VARIABLES.TF-> 
-> command to generate the pub file ->    ssh-keygen -f oregon-region-key-pair


1. Install terraform - https://www.terraform.io/downloads 
2. Install Python if not already done  https://www.python.org/downloads/
3. Install aws cli - https://docs.aws.amazon.com/cli/v1/userguide/install-macos.html 
4. Create access key for terraform https://aws.amazon.com/console/ 
5. Use aws configure to configure the access keys  [ aws configure command ]
6. Create a S3 bucket and add the name in config.tf
7. Define variables.tf and config.tf files.
8. Create Key pair ->    ssh-keygen -f oregon-region-key-pair 
9. Run - terraform init
10. terraform plan -out "file.plan"
11. terraform apply 
12. terraform destroy
13. Define other necessary files. 


