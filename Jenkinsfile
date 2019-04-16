node {
stage('fetch_latest_code') {
step {
sh "mkdir -p /Storage/terraform/terraform-test"
sh "cd /Storage/terraform/terraform-test"
sh "git clone https://github.com/manishmu/terform.git"
}
}

stage('init_and_plan') {
step {
sh "cd /Storage/terraform/terraform-test"
sh "sudo terraform init "
sh "sudo terraform plan "
}
}

stage('apply_changes') {
step {
sh "sudo terraform apply /Storage/terraform/terraform-test"
}
}
post { 
  always { 
    cleanWs()
  }
}
}
