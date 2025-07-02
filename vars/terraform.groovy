def runTerraformForModule(String moduleName) {
    dir("terraform/${moduleName}") {
        echo "🔧 Running Terraform for ${moduleName}..."
        sh 'terraform init'
        sh 'terraform plan -out=tfplan'
        sh 'terraform apply -auto-approve tfplan'
    }
}

return this
