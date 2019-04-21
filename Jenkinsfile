pipeline {
    agent any
stages {
stage('fetch_latest_code') {
steps {
sh "mkdir -p /tmp/terraform-test/"
sh "cd /tmp/terraform-test/"
sh "git clone https://github.com/manishmu/terform.git /tmp/terraform-test/."
sh "sudo cp -rf /tmp/terraform-test/* /Storage/terraform-work/"
sh "sudo rm -rf /tmp/terraform-test"
}
}
stage('init_and_plan') {
steps {
sh " sudo su - manish"
sh " sudo terraform init /Storage/terraform-work/"
sh " sudo terraform plan /Storage/terraform-work/"
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
