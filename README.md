## DevOps Technical Assessment:
### Deploying SonarQube on Amazon AWS with Terraform (Using Only HashiCorp Modules)

#### Objective:
Your task is to set up a SonarQube instance on Amazon AWS, utilizing Terraform to provision necessary resources. The SonarQube instance should be publicly available, accessible via the internet. It should also be configured to connect to an RDS instance running PostgreSQL, ensuring that the PostgreSQL database is not visible outside of the Virtual Private Cloud (VPC). You are only allowed to use modules provided by HashiCorp (e.g., VPC, AWS), and the deployment should adhere to AWS Free Tier limits. Note the following assumptions:

- The reviewer will have Terraform installed on their machines.
- AWS access keys and secret access keys will be provisioned on the machine as environment variables.
- The user will have sufficient privileges to provision infrastructure.
- All infrastructure will use services that are available in AWS Region US-East-1.
- The reviewer will leverage the SonarQube instance to publish results of an internal test project onto the newly deployed SonarQube instance.

#### Requirements:
- Use only HashiCorp modules to automate the provisioning of AWS resources.
- Ensure the deployment falls within the AWS Free Tier limits.
- Deploy a publicly available SonarQube instance on an EC2 instance.
- Connect the SonarQube instance to an RDS instance running PostgreSQL, ensuring it's only accessible within the VPC.
- Ensure appropriate security measures are implemented.
- Document the deployment process and any relevant configurations.

#### Instructions:
- Setting up Terraform:
  - Ensure Terraform is installed on your local machine.
  - Set up AWS access keys and secret access keys as environment variables on your machine.

- Create Terraform Configuration:
  - Create a directory for your Terraform project.
  - Initialize Terraform within the directory.
  - Define the AWS provider and required resources using only HashiCorp modules in the Terraform configuration file (e.g., main.tf).
- Provision AWS Resources:
  - Utilize HashiCorp modules to define the VPC, subnets, and other networking components required, ensuring they fall within the AWS Free Tier limits and are provisioned in 
    the US-East-1 region.
  - Define the EC2 instance for SonarQube within the created VPC. Ensure it meets the minimum requirements for SonarQube and falls within the Free Tier limits. Make sure to 
    configure the instance to be publicly accessible.
  - Configure security groups using HashiCorp modules to allow necessary inbound and outbound traffic for SonarQube within the VPC.
  - Use HashiCorp modules to set up an RDS instance running PostgreSQL within the same VPC. Configure security groups, subnet groups, and any necessary parameters to ensure 
    it's only accessible within the VPC and falls within the Free Tier limits.
- Deploy SonarQube:
  - Utilize user data or provisioners to automate the installation and configuration of SonarQube on the EC2 instance.
  - Configure SonarQube to connect to the RDS instance for its PostgreSQL database, ensuring it's done within the VPC.
- Security and Access Management:
  - Implement IAM roles and policies to restrict access to AWS resources. ○ Ensure that security groups are configured to allow communication only within the VPC and not from 
    the internet, except for the SonarQube instance, which should be publicly accessible.
- Testing and Validation:
  - Test the deployment to ensure SonarQube is accessible and functioning correctly via the internet.
  - Verify that SonarQube can connect to the RDS PostgreSQL instance without issues within the VPC.
- Documentation:
  - Create documentation detailing the deployment process, including any configuration parameters used.
  - Include any troubleshooting steps or considerations for future maintenance.

#### Submission:
- Provide your Terraform configuration files.
- Include documentation detailing the deployment process and any relevant configurations.
- Submit any additional scripts or configuration files used in the deployment.

#### Evaluation Criteria:
- _Correctness_: Does the solution meet the specified requirements using only HashiCorp modules?
- _Efficiency_: Are resources provisioned efficiently, considering cost and performance?
- _Security_: Are appropriate security measures implemented, especially regarding the isolation of the PostgreSQL database within the VPC and the public accessibility of 
SonarQube?
- _Documentation_: Is the deployment process well-documented and clear?
- _Adherence to Best Practices_: Does the solution follow best practices for AWS and infrastructure as code while utilizing only HashiCorp modules, staying within the Free 
Tier limits, and considering the specified assumptions?

 
Have fun coding! 🚀
