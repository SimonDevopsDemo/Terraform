pipeline {
  agent any

  parameters {
    string(name: 'GIT_BRANCH', defaultValue: 'master', description: 'Git branch to build')
    booleanParam(name: 'DEPLOY_EC2', defaultValue: false, description: 'Deploy EC2 infrastructure')
    booleanParam(name: 'DEPLOY_RDS', defaultValue: false, description: 'Deploy RDS infrastructure')
    booleanParam(name: 'DESTROY', defaultValue: false, description: 'Destroy selected infrastructure')
  }

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
    AWS_SECRET_ACCESS_KEY = credentials('aws-access-key')
  }

  stages {
    stage('Checkout Code') {
      steps {
        git branch: "${params.GIT_BRANCH}", url: 'https://github.com/SimonDevopsDemo/Terraform.git'
      }
    }

    stage('Process EC2') {
      when {
        expression { return params.DEPLOY_EC2 }
      }
      steps {
        dir('Ec2-Instance') {
          script {
            bat 'terraform init'
            def planCmd = params.DESTROY ?
              'terraform plan -destroy -out=tfplan' :
              'terraform plan -out=tfplan'
            bat planCmd
            bat 'terraform apply -auto-approve tfplan'
          }
        }
      }
    }

    stage('Process RDS') {
      when {
        expression { return params.DEPLOY_RDS }
      }
      steps {
        dir('RDS') {
          script {
            bat 'terraform init'
            def planCmd = params.DESTROY ?
              'terraform plan -destroy -out=tfplan' :
              'terraform plan -out=tfplan'
            bat planCmd
            bat 'terraform apply -auto-approve tfplan'
          }
        }
      }
    }

    stage('Validate Inputs') {
      when {
        not {
          anyOf {
            expression { params.DEPLOY_EC2 }
            expression { params.DEPLOY_RDS }
          }
        }
      }
      steps {
        error "No resource selected. Please enable at least DEPLOY_EC2 or DEPLOY_RDS."
      }
    }
  }
}