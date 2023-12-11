pipeline {
    agent any

    stages {
        
        stage('Git Checkout') {
            steps {
                // Git Checkout
                script {
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rneduncheralathan/testreactapp']])
                }
            }
        }
        
        stage('Docker container Delete') {
            steps {
                // Delete Docker container
                sh 'docker rm -f my-angular-app-container'
            }
        }
        
        stage('Docker Build') {
            steps {
                // Build Docker image
                script {
                    docker.build('my-angular-app:latest')
                }
            }
        }

        stage('Deploy') {
            steps {
                // Deploy Docker container
                sh 'docker run -d -p 8082:80 --name my-angular-app-container my-angular-app'
            }
        }
        
    }
}
