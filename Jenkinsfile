properties([parameters([choice(choices: ['plan', 'apply', 'destroy'], name: 'action')])])
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
            when {
                expression { params.action == 'plan'}
            }
            steps {
                    sh "cd sandbox && terraform init"
                    sh 'cd sandbox && terraform plan -out tfplan'
            }
        }
        stage('Terraform Apply') {
            when {
                expression { params.action == 'apply'}
            }
            steps {
                    sh 'cd sandbox && terraform apply --auto-approve "tfplan"'
            }
        }
        stage('Storing state file to S3') {
            steps {
                    sh 'cd sandbox && aws s3 cp tfplan s3://terraform-bucket-tfvars/'
            }
        }
         stage('Terraform Destroy') {
             when {
                expression { params.action == 'destroy'}
            }
            steps {
                sh 'cd sandbox && terraform destroy --auto-approve'
            }
        }
    }
}
