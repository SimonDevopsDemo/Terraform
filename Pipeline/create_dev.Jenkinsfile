pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
    AWS_SECRET_ACCESS_KEY = credentials('aws-access-key')
  }

  parameters {
    string(name: 'GIT_BRANCH', defaultValue: 'master', description: 'Git branch to build')
    booleanParam(name: 'provision_ec2', defaultValue: false, description: 'Provision EC2')
    booleanParam(name: 'provision_rds', defaultValue: false, description: 'Provision RDS')
    booleanParam(name: 'provision_s3',  defaultValue: false, description: 'Provision S3')
    booleanParam(name: 'app_infra',  defaultValue: false, description: 'Provision infrastructure')
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

    stage('Provision EC2') {
      when {
        expression { return params.provision_ec2 }
      }
      steps {
        script {
          method.runTerraformForModule("ec2")
        }
      }
    }

    stage('Provision RDS') {
      when {
        expression { return params.provision_rds }
      }
      steps {
        script {
          method.runTerraformForModule("rds")
        }
      }
    }

    stage('Provision app-infra') {
      when {
        expression { return params.app_infra }
      }
      steps {
        script {
          method.runTerraformForModule("app-infra")
        }
      }
    }
  }

  post {
    success {
      echo "✅ All selected Terraform modules applied successfully."
    }
    failure {
      echo "❌ Terraform execution failed."
    }
  }
}
