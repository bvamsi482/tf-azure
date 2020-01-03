pipeline {
  agent any
  environment {
    PATH = "${PATH}:${getTerraformPath()}"
  }
   stages{
    stage('terraform init and apply - dev'){
      steps{
        sh returnStatus: true, script: 'terraform workspace new dev'
        sh "terraform init"
        sh "terraform apply -auto-approve -var-file=dev.tfvars"
        
      }
    }

    stage('terraform init and apply - prod'){
      steps{
        sh returnStatus: true, script: 'terraform workspace new prod'
        sh "terraform init"
        sh "terraform apply -auto-approve -var-file=prod.tfvars"
        
      }
    }
    }   
   }
  


def getTerraformPath(){
  def tfHome = tool name: 'terraform', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
  return tfHome
}