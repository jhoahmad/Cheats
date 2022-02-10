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
  
  stage('Deploy to K8s')
  {
 
    sshagent(['minikube-jenkins'])
       sh 'scp -r -o StrictHostKeyChecking=no deployment.yaml lorna@192.168.100.250:/path'
  }
  
  stage('Deploy to minikube') {
    
    sh "ssh lorna@192.168.100.250 minikube kubectl -- apply -f deployment.yaml"
  }
}
