pipeline {
  agent any

  parameters {
    string(name: 'GIT_BRANCH', defaultValue: 'main', description: 'Git branch to build')
    booleanParam(name: 'CREATE', defaultValue: true, description: 'Create the infrastructure')
    booleanParam(name: 'DESTROY', defaultValue: false, description: 'Destroy the infrastructure')
  }

  environment {
    AWS_ACCESS_KEY_ID = credentials('aws-access-key')
    AWS_SECRET_ACCESS_KEY = credentials('aws-access-key')
  }

  stages {
    stage('Checkout Code') {
      steps {
        git branch: "${params.GIT_BRANCH}", url: 'https://github.com/SimonDevopsDemo/Terraform.git'
      }
    }

    stage('Terraform Init') {
      steps {
        bat 'terraform init'
      }
    }

    stage('Terraform Plan or Destroy') {
      steps {
        script {
          if (params.CREATE) {
            bat 'terraform plan -out=tfplan'
          } else if (params.DESTROY) {
            bat 'terraform plan -destroy -out=tfplan'
          } else {
            echo 'Neither CREATE nor DESTROY selected.'
            error('Please select at least one operation.')
          }
        }
      }
    }

    stage('Terraform Apply') {
      when {
        anyOf {
          expression { params.CREATE }
          expression { params.DESTROY }
        }
      }
      steps {
        bat 'terraform apply -auto-approve tfplan'
      }
    }
  }
}
