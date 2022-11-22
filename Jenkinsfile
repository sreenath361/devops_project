pipeline {
    environment {
        registry = 'sreenathreddy07/dockerswarm_jenkins_k8s'
        registryCredential = 'DockerHubAccess'
        /*dockerhost = '10.32.15.213'*/
        dockerImage = ''
    }
    agent any
    stages {
        stage('Code Checkout') {
            steps {
                git 'git@github.com:sreenath361/devops_project.git'
                sh "ls -al"
                sh "pwd"
            }
        }
        stage('Building the image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":v$BUILD_NUMBER"
                }
            }
        }
        stage('Push Image To DockerHub') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Cleaning Up') {
            steps {
                sh "docker rmi $registry:v$BUILD_NUMBER"
            }
        }
        stage('Deploying the App') {
            steps {
                sh "ls -al"
                sh "pwd"
                sh "docker-compose up -d"
            }
        }
    }
}
