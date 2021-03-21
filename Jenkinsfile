node {
    checkout scm

    docker.withRegistry('https://hub.docker.com/', 'cheplorna') {

        def customImage = docker.build("testapp:${env.BUILD_ID}")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
