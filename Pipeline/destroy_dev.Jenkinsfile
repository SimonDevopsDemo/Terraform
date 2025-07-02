pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
    AWS_SECRET_ACCESS_KEY = credentials('aws-access-key')
  }

  parameters {
    string(name: 'GIT_BRANCH', defaultValue: 'master', description: 'Git branch to build')
    booleanParam(name: 'destroy_ec2', defaultValue: false, description: 'Destroy EC2')
    booleanParam(name: 'destroy_rds', defaultValue: false, description: 'Destroy RDS')
    booleanParam(name: 'destroy_s3',  defaultValue: false, description: 'Destroy S3')
    booleanParam(name: 'destroy_app_infra',  defaultValue: false, description: 'Destroy infrastructure')
  }

  stages {
    stage('Checkout Code') {
      steps {
        git branch: "${params.GIT_BRANCH}", url: 'https://github.com/SimonDevopsDemo/Terraform.git'
      }
    }

    stage('Load Terraform Functions') {
      steps {
        script {
          def commonVars = "${env.WORKSPACE}/vars/terraform.groovy"
          method = load(commonVars)
        }
      }
    }

    stage('Destroy EC2') {
      when {
        expression { return params.destroy_ec2 }
      }
      steps {
        script {
          method.destroyTerraformForModule("ec2")
        }
      }
    }

    stage('Destroy RDS') {
      when {
        expression { return params.destroy_rds }
      }
      steps {
        script {
          method.destroyTerraformForModule("rds")
        }
      }
    }

    stage('Destroy app-infra') {
      when {
        expression { return params.destroy_app_infra }
      }
      steps {
        script {
          method.destroyTerraformForModule("app-infra")
        }
      }
    }
  }

  post {
    success {
      echo "✅ All selected Terraform modules destroyed successfully."
    }
    failure {
      echo "❌ Terraform destroy failed."
    }
  }
}
