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
    }
}