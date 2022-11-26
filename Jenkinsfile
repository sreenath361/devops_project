pipeline {
    agent any
 
    stages {
        stage('Code Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/terraform_modules']], extensions: [], userRemoteConfigs: [[url: 'git@github.com:sreenath361/devops_project.git']]])
                sh "cd sandbox && pwd && ls -al"
            }
        }
	stage('Aws get-coller-id') {
	    steps{
		  sh "aws sts get-caller-identity"
		}
	}
        stage('Terraform Plan') {
            steps {
                    sh "cd sandbox && terraform init"
                    sh 'cd sandbox && terraform plan -out tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                    sh 'cd sandbox && terraform apply --auto-approve "tfplan"'
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
