node {
stage('fetch_latest_code') {
steps {
sh "mkdir -p /Storage/terraform/terraform-test"
sh "cd /Storage/terraform/terraform-test"
sh "git clone https://github.com/manishmu/terform.git"
}
}

stage('init_and_plan') {
steps {
sh "cd /Storage/terraform/terraform-test"
sh "sudo terraform init "
sh "sudo terraform plan "
}
}

stage('apply_changes') {
steps {
sh "sudo terraform apply /Storage/terraform/terraform-test"
}
}
post { 
  always { 
    cleanWs()
  }
}
}
