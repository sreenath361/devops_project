pipeline {
    environment {
        registry = 'sreenathreddy07/dockerswarm_jenkins_k8s'
        registryCredential = 'DockerHubAccess'
        /*dockerhost = '10.32.15.213'*/
        dockerImage = ''
    }
    agent any
    stages {
        stage('Cloning our Git') {
            steps {
                git 'git@github.com:sreenath361/devops_project.git'
                sh "ls -al"
                sh "pwd"
            }
        }
        stage('Building our image') {
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
        stage('Cleaning up') {
            steps {
                sh "docker rmi $registry:v$BUILD_NUMBER"
            }
        }
        stage('Deploying the app') {
            steps {
                sh "ls -al"
                sh "pwd"
                sh "docker-compose up -d"
            }
        }
    }
}
