pipeline {
    agent any
    stages{
        stage{
            step ('checking out'){
                echo "checking out from hub"
            }
        }
        stage('build docker img'){
            step{
                echo 'building docker img'
                sh 'docker build -t proj-static-web:latest . '
            }
        }
        stage('cleaning old container'){
            step{
                echo 'stops and removing old container'
                sh 'docker stop proj-static-web:latest || true'
                sh 'docker rm proj-static-web:latest || true'
            }  

        }
        stage('deploy application'){
            step{
                echo 'deplo new con on port 8081...'
                sh ' docker run -dit --name static-web-app proj-static-web:latest'
            }
        }

    }
    post {
        sucess{
            echo 'delpoyemt sucess'
        }
        failure {
            echo 'deployment failure'
        }
    }
}