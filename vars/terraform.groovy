def runTerraformForModule(String moduleName) {
    dir("infrastructure_module/${moduleName}") {
        echo "🔧 Running Terraform for ${moduleName}..."
        bat 'terraform init'
        bat 'terraform plan -out=tfplan'
        bat 'terraform apply -auto-approve tfplan'
    }
}

def destroyTerraformForModule(String moduleName) {
    dir("infrastructure_module/${moduleName}") {
        echo "🧨 Destroying Terraform resources for ${moduleName}..."

        // Initialize Terraform
        bat 'terraform init'

        // Plan the destroy (shows what will be deleted)
        bat 'terraform plan -destroy -out=tfplan'

        // Apply the destroy plan
        bat 'terraform apply -auto-approve tfplan'
    }
}

return this

