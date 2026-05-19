#!/bin/bash

set -e

# ===============================
# UPDATE SYSTEM
# ===============================
dnf update -y

# ===============================
# INSTALL REQUIRED TOOLS
# ===============================
dnf install -y wget curl git

# ===============================
# INSTALL JAVA 21 (REQUIRED FOR JENKINS LTS)
# ===============================
dnf install -y java-21-openjdk java-21-openjdk-devel

# Set Java 21 as default
alternatives --set java /usr/lib/jvm/java-21-openjdk/bin/java || true

# Verify Java
java -version > /var/log/java-version.log

# ===============================
# ADD JENKINS REPOSITORY
# ===============================
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import Jenkins GPG key
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# ===============================
# INSTALL JENKINS
# ===============================
dnf install -y jenkins

# ===============================
# FORCE JENKINS TO USE JAVA 21
# ===============================
echo 'JENKINS_JAVA_CMD=/usr/lib/jvm/java-21-openjdk/bin/java' >> /etc/sysconfig/jenkins

# ===============================
# ENABLE AND START JENKINS
# ===============================
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

# ===============================
# OPEN PORT 8080 (FIREWALLD)
# ===============================
systemctl enable firewalld || true
systemctl start firewalld || true

firewall-cmd --permanent --add-port=8080/tcp || true
firewall-cmd --reload || true

# ===============================
# LOGS FOR DEBUGGING
# ===============================
systemctl status jenkins --no-pager > /var/log/jenkins-status.log || true

cat /var/lib/jenkins/secrets/initialAdminPassword > /var/log/jenkins-password.txt || true

# ===============================
# INSTALL HASHICORP TERRAFORM
# ===============================
dnf install -y yum-utils wget curl unzip
dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
dnf install -y terraform
terraform version > /var/log/terraform-version.log
echo "Terraform installation completed at $(date)" > /var/log/terraform-install.log
terraform --version

