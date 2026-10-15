pipeline {
    agent any

    stages {
        stage('1. Checkout Code') {
            steps {
                echo 'Pulling latest code from GitHub...'
                // Code is automatically checked out by Jenkins Git integration
            }
        }

        stage('2. Build Docker Image') {
            steps {
                echo 'Building Docker container image...'
                sh 'docker build -t proj-static-web:latest .'
            }
        }

        stage('3. Cleanup Old Container') {
            steps {
                echo 'Stopping and removing old container if running...'
                sh 'docker stop static-web-app || true'
                sh 'docker rm static-web-app || true'
            }
        }

        stage('4. Deploy Application') {
            steps {
                echo 'Starting new container on port 8081...'
                sh 'docker run -d -p 8081:80 --name static-web-app proj-static-web:latest'
            }
        }
    }

    post {
        success {
            echo '🎉 Deployment successful! App is running on http://localhost:8081'
        }
        failure {
            echo '❌ Pipeline failed! Check logs above.'
        }
    }
}