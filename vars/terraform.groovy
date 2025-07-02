def runTerraformForModule(String moduleName) {
    dir("infrastructure_module/${moduleName}") {
        echo "🔧 Running Terraform for ${moduleName}..."
        bat 'terraform init'
        bat 'terraform plan -out=tfplan'
        bat 'terraform apply -auto-approve tfplan'
    }
}

return this
