node {
    checkout scm

    docker.withRegistry('https://hub.docker.com/u/cheplorna', 'd9cc0f03-3410-4766-bd7d-4ebe1868361f') {

        def customImage = docker.build("my-image:${env.BUILD_ID}")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
