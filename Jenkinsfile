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
		sh 'sudo docker rmi urldetector:v1.21'
		sh 'sudo docker rmi swar2001/urldetector:v1.21'
		sh 'sudo docker rmi swar2001/urldetector:latest'
                sh 'cd /home/ec2-user/jenkinsws/workspace/urldetector && sudo docker build -t $JOB_NAME:v1.$BUILD_ID .'
		sh 'sudo docker images'
            }
        }

      stage('Associate the Image name with Docker Hub ID') {
            steps{

                sh 'sudo docker image tag $JOB_NAME:v1.$BUILD_ID swar2001/$JOB_NAME:v1.$BUILD_ID'
                sh 'sudo docker image tag $JOB_NAME:v1.$BUILD_ID swar2001/$JOB_NAME:latest'
            }
        }

	stage('Login to Docker Hub') {
            steps{
                
                withCredentials([string(credentialsId: 'DOCKER_HUB_PASSWORDD', variable: 'DOCKER_HUB_PASSWD')]) {
                sh 'sudo docker login -u swar2001 -p $DOCKER_HUB_PASSWD'
    // some block
}
                
            }
	}

	stage('Push Docker Image to Docker Hub') {
            steps{
               	sh 'sudo docker image push swar2001/$JOB_NAME:v1.$BUILD_ID'
                sh 'sudo docker image push swar2001/$JOB_NAME:latest'
	        	sh 'sudo docker rmi swar2001/$JOB_NAME:v1.$BUILD_ID'
	        	sh 'sudo docker rmi swar2001/$JOB_NAME:latest'	
            }
        }
    }
}