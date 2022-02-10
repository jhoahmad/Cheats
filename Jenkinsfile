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
  
  stage('Deploy to GKE') {
            steps{
                sh "sed -i 's/hello:latest/hello:${env.BUILD_ID}/g' deployment.yaml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
}
