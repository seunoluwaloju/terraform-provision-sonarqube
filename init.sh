#!/bin/bash
sudo yum update -y
sudo yum install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user


# Load DB secret
export DB_USER=$(aws secretsmanager get-secret-value --secret-id sonarqube/rds/credentials --query SecretString --output text | jq --raw-output | jq -r .DB_USER)
export DB_PASSWORD=$(aws secretsmanager get-secret-value --secret-id sonarqube/rds/credentials --query SecretString --output text | jq --raw-output | jq -r .DB_PASSWORD)
export DB_URL=$(aws secretsmanager get-secret-value --secret-id sonarqube/rds/credentials --query SecretString --output text | jq --raw-output | jq -r .DB_URL)


sudo docker run --name sonarqube \
  -p 9000:9000 \
 -e SONARQUBE_WEB_JAVA_OPTS="-Xmx384m -Xms384m" \
  -e SONARQUBE_SEARCH_JAVA_OPTS="-Xmx384m -Xms384m" \
  -e SONARQUBE_CE_JAVA_OPTS="-Xmx384m -Xms384m" \
  -m 1g \
  sonarqube:8.9.7-community

#sudo docker run -d --name sonarqube \
#     -p 9000:9000 \
#     -e SONAR_JDBC_URL="${DB_URL}" \
#     -e SONAR_JDBC_USERNAME="${DB_USER}" \
#     -e SONAR_JDdockeBC_PASSWORD="${DB_PASSWORD}" \
#     -v sonarqube_data:/opt/sonarqube/data \
#     -v sonarqube_extensions:/opt/sonarqube/extensions \
#     -v sonarqube_logs:/opt/sonarqube/logs \
#     sonarqube:lts-developer