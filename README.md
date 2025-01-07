### Deploying SonarQube on Amazon AWS with Terraform
This project sets up a SonarQube instance on Amazon AWS, utilizing Terraform to provision necessary resources. 
The SonarQube instance is set to be publicly available, accessible via the internet and it is  also be configured 
to connect to an RDS instance running PostgreSQL. The PostgreSQL database is not visible outside of the VPC. 

#### Pre-requisites:
- Terraform is installed on your machines.
- AWS access keys and secret access keys is provisioned on your machine as environment variables.
- Your aws user has sufficient privileges to provision infrastructure.
- Infrastructure use AWS Region US-East-1.


#### Deployment Steps:

### bootstrap directory -- start here
This directory contains the necessary files to bootstrap the terraform project with S3 and Dynamodb
resources for backend state.
1. cd bootstrap
2. terraform init
3. terraform apply -auto-approve

### sonarqube directory
This directory contains the terraform code to provision network resources, ec2 instance and postgress
database for sonarqube. It uses the backend state created in the bootstrap directory.
1. cd sonarqube
2. Update bucket in providers.tf with the bucket name created in bootstrap directory
3. terraform init
4. terraform apply

