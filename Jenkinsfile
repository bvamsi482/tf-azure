pipeline {
  agent any
  environment {
    PATH = "${PATH}:${getTerraformPath()}"
  }
   stages{
    stage('azure auth') {
        withCredentials([azureServicePrincipal(credentialsId: 'Terraform-temp',
                                    subscriptionIdVariable: 'SUBS_ID',
                                    clientIdVariable: 'CLIENT_ID',
                                    clientSecretVariable: 'CLIENT_SECRET',
                                    tenantIdVariable: 'TENANT_ID')]) {
            sh "az login --service-principal -u $CLIENT_ID -p $CLIENT_SECRET -t $TENANT_ID"

    }
    }
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