Search the AMI ID in the AWS and add it in the variables.tf
PUBLIC_KEY_PATH ADD FULL PATH IN VARIABLES.TF-> 
-> command to generate the pub file ->    ssh-keygen -f oregon-region-key-pair


1. Install terraform - https://www.terraform.io/downloads 
2. Install Python if not already done  https://www.python.org/downloads/
3. Install aws cli - https://docs.aws.amazon.com/cli/v1/userguide/install-macos.html 
4. Create access key for terraform https://aws.amazon.com/console/ 
5. Use aws configure to configure the access keys  [ aws configure command ] 
6. Define variables.tf and config.tf files. 
7. Run - terraform init 
8. Define other necessary files. 
9. Create Key pair ->    ssh-keygen -f oregon-region-key-pair 

