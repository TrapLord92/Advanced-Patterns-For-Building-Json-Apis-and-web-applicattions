def call(String credentialsId, String dockerFile, String imageName) {
    echo "Building the Docker image in directory 'greenlight'"
    
    dir('greenlight') {
        withCredentials([usernamePassword(credentialsId: credentialsId, passwordVariable: 'PASS', usernameVariable: 'USER')]) {
            sh "docker build -f ${dockerFile} -t ${imageName} ."
            sh "echo \$PASS | docker login -u \$USER --password-stdin"
            sh "docker push ${imageName}"
        }
    }
}
