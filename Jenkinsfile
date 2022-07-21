node {
  stage('Checkout code') {
     checkout scm
}     
  
  stage('Build image') {
    dockerImage = docker.build("cheplorna/lorna:${env.BUILD_ID}")
  }

  stage('Push image') {
    docker.withRegistry('https://registry.hub.docker.com/', 'dockerHub') {
      dockerImage.push()
    }
  }
  
  stage('Deploy to minikube') {
    
    sh "ssh lorna@192.168.100.250 StrictHostKeyChecking=no minikube kubectl -- apply -f deployment.yaml"
  }
}
