pipeline {
    agent any
 
    stages {
        stage('Code Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/terraform_modules']], extensions: [], userRemoteConfigs: [[url: 'git@github.com:sreenath361/devops_project.git']]])
                sh "cd sandbox && pwd && ls -al"
            }
        }
        stage('Terraform Plan') {
            when {
                    expression {
                        params.ACTION == 'PLAN'
                    }
                }
            steps {
                    sh "cd sandbox && terraform init"
                    sh 'cd sandbox && 
terraform plan'
            }
        }
        stage('Terraform Apply') {
            when {
                    expression {
                        params.ACTION == 'APPLY'
                    }
                }
            steps {
                    sh 'cd sandbox && terraform apply --auto-approve'
            }
        }
        stage('Terraform Destroy') {
            when {
                    expression {
                        params.ACTION == 'DESTROY'
                    }
                }
            steps {
                    sh 'terraform init'
                    sh 'terraform destroy --auto-approve'
                }
        }
    }
}
