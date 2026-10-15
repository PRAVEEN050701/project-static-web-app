pipeline {
    agent any

    stages {
        stage('1. Checkout Code') {
            steps {
                echo 'Pulling latest code from GitHub...'
            }
        }

        stage('2. Build Docker Image') {
            steps {
                echo 'Building Docker container image...'
                bat 'docker build -t proj-static-web:latest .'
            }
        }

        stage('3. Cleanup Old Container') {
            steps {
                echo 'Stopping and removing old container if running...'
                bat 'docker stop static-web-app || exit 0'
                bat 'docker rm static-web-app || exit 0'
            }
        }

        stage('4. Deploy Application') {
            steps {
                echo 'Starting new container on port 8081...'
                bat 'docker run -d -p 8081:80 --name static-web-app proj-static-web:latest'
            }
        }
    }
}