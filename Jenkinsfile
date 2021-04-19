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

 stage('Deploy App') {
	sh ["kubectl get nodes"]
        script {
          kubernetesDeploy(kubeconfigId: "Kubecluster2")
}

}

}
