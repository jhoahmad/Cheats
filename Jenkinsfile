node {
  stages{
    stage('Checkout code') {
      steps{
        checkout scm
      }
    }
  }
  
    stage('Build image') {
      steps{
        dockerImage = docker.build("cheplorna/lorna:${env.BUILD_ID}")
      }
    }

    stage('Push image') {
      steps{
        docker.withRegistry('https://registry.hub.docker.com/', 'dockerHub') {
        dockerImage.push()
        }
      }
    }
  
  stage('Deploy to kubernetes') {
    steps{ 
     sh "ssh lorna@192.168.100.58 StrictHostKeyChecking=no kubernetes kubectl -- apply -f deployment.yaml"
    }
  }
}
