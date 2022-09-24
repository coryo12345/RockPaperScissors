pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'docker build -t rockpaperscissors:latest .'
            }
        }
        stage('Test') {
            steps {
                echo 'Would run unit tests here...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh 'docker stop rockpaperscissors || true'
                sh 'docker rm rockpaperscissors || true'
                sh 'docker run -d --name rockpaperscissors \
                    --restart always \
                    --network=webnetwork \
                    rockpaperscissors:latest'
            }
        }
    }
}