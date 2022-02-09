node {
  stage('Checkout code') {
     checkout scm
}     
  
  stage('Initialize'){
        def dockerHome = tool 'myDocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
    }

  stage('Build image') {
    dockerImage = docker.build("cheplorna/lorna:${env.BUILD_ID}")
  }

  stage('Push image') {
    docker.withRegistry('https://registry.hub.docker.com/', 'dockerHub') {
      dockerImage.push()
    }
  }
}
