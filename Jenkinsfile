node {
    checkout scm

    docker.withDockerRegistry('https://hub.docker.com/', 'dockerHub') {

        def customImage = docker.build("testapp:${env.BUILD_ID}")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
