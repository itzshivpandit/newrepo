pipeline {
    agent any

    environment {
        BUILD_NUMBER = "${env.BUILD_ID}" // Use Jenkins build ID as the Docker image tag
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from version control
                git 'https://github.com/itzshivpandit/newrepo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image with the tag
                    sh 'docker build -t shivsharma01/myimage001:$BUILD_NUMBER .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container with the specified port mapping
                    sh 'docker run -d -p 3215:80 --name mycontainer-$BUILD_NUMBER shivsharma01/myimage001:$BUILD_NUMBER'
                }
            }
        }
    }

    post {
        always {
            script {
                // List all running Docker containers
                sh 'docker ps -a'
            }
        }
    }
}
