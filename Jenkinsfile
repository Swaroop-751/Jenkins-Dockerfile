pipeline {

    agent {
        label "ansiblenode"
    }

    stages {
        stage('Pull the Dockerfile From Github') {
            steps {
                git branch: 'main', url: 'https://github.com/Swaroop-751/Jenkins-Dockerfile.git'
            }
        }

     stage('Build Docker Image') {
            steps {
                sh 'cd /home/ec2-user/jenkinsws/workspace/urldetector && sudo docker build -t $JOB_NAME:v1.$BUILD_ID .'
		sh 'sudo docker images'
            }
        }

      stage('Associate the Image name with Docker Hub ID') {
            steps{
		sh 'sudo docker rmi urldetector:1.18'
                sh 'sudo docker image tag $JOB_NAME:v1.$BUILD_ID swar2001/$JOB_NAME:v1.$BUILD_ID'
                sh 'sudo docker image tag $JOB_NAME:v1.$BUILD_ID swar2001/$JOB_NAME:latest'
            }
        }
    }
}