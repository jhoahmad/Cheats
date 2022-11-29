node {
  stages{
    stage('Checkout code') {
      checkout scm
    }
  }
  
    stage('Build image') {
      dockerImage = docker.build("cheplorna/lorna:${env.BUILD_ID}")
    }

    stage('Push image') {
      docker.withRegistry('https://registry.hub.docker.com/', 'dockerHub') {
      dockerImage.push()
        }
      }
  
  stage('Deploy to kubernetes') {
      sh "ssh lorna@192.168.100.58 StrictHostKeyChecking=no kubernetes kubectl -- apply -f deployment.yaml"
  }
}
