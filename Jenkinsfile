pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('shivsharma01')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/itzshivpandit/newrepo.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t shivsharma01/myimage02:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push shivsharma01/myimage02:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
