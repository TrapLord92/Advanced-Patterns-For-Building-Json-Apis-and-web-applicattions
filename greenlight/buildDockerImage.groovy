// buildDockerImage.groovy

def buildDockerImage(String credentialsId, String dockerFile, String imageName) {
    echo "Building the Docker image in directory 'greenlight'"
    
    dir('greenlight') {
        withCredentials([usernamePassword(credentialsId: credentialsId, passwordVariable: 'PASS', usernameVariable: 'USER')]) {
            // Build Docker image
            sh "docker build -f ${dockerFile} -t ${imageName} ."

            // Login and push the Docker image
            sh "echo \$PASS | docker login -u \$USER --password-stdin"
            sh "docker push ${imageName}"
        }
    }
}

def build_go_binary() {
    dir('greenlight'){
    echo "Building Go binary"
    // Compile Go binary
    sh 'go build -o greenlight/cmd/api/main.go'}
}


return this