pipeline {
    agent any

    environment {
        IMAGE_NAME = 'krrg14/web-app'
        CONTAINER_NAME = 'Nodejs-app-demo'
    }

    stages {
        
        stage('checkout') {
            steps {
                git branch: 'main', url 'https://github.com/krrg14/Jenkins-Pipeline'
            }
        }
        
        stage('install dependencies'){
            steps {
                sh 'npm ci'
            }
        }

        stage('test'){
            steps {
                sh 'npm test'
            }
        }

        stage('build application') {
            steps {
                sh 'npm run application'
            }
        }

        stage('docker-login') {
            steps{
                withCredentials([usernamePassword(
                    credentials: 'docker-cred',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {
                    sh 'docker login -u $DOCKER_USER -p $DOCKER_PASSWORD'
                }
            }
        }

        stage('docker build image'){
            steps {
                sh 'docker build -t $IMAGE_NAME:$BUILD_NUMBER .'
            }
        }

        stage('deploy'){
            steps {
                sh '''
                    docker rm -f $CONTAINER_NAME || true

                    docker run -d \
                    --name $CONTAINER_NAME \
                    -p 3000:3000
                    $IMAGE_NAME:$BUILD_NUMBER
                '''
            }
        }

        stage('verify'){
            steps {
                sh 'docker ps --filter name=$CONTAINER_NAME'
            }
        }
    }

    post {
        success {
            echo 'CI/CD pipeline completed successfully!'
        }
        failure {
            echo 'CI/CD pipeline failure, Checkout the pipeline console'
        }
    }
}