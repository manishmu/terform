GIT_USERNAME="manish.mudholkar@gmail.com"
GIT_PASSWORD="s@rika2306"
workspace="/var/lib/jenkins/workspace/new-terraform-deployment"
pipeline {
    agent any
stages {
stage('fetch_latest_code') {
steps {
sh "mkdir -p /tmp/terraform-test/"
sh "cd /Storage/terraform-work/"
sh "sudo git clone https://github.com/manishmu/terform.git /Storage/terraform-work/."
}
}
stage('init_and_plan') {
steps {
sh "sudo su - manish"
sh "sudo /usr/local/bin/terraform init /Storage/terraform-work/"
sh "sudo /usr/local/bin/terraform plan /Storage/terraform-work/"
}
}
stage('apply_changes') {
steps {
sh "sudo su - manish"
sh "sudo terraform apply -input=false -auto-approve /Storage/terraform-work/"
}
}
}
}
