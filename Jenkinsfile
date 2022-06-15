pipeline{
    agent any
    environment{
        DOCKERHUB_CREDENTIALS = credentials('docker_hub')
    }
    stages{
        stage("build a code"){
            steps{
                script{
                    sh "mvn clean install"
                }
            }
        }
         stage("build a image"){
            steps{
                script{
                    sh "docker build -t kallepalli/mynewimage:$BUILD_NUMBER ."
                }
            }
        }
        stage("push a image"){
            steps{
                script{
                    withCredentials([string(credentialsId: 'na_dockerhub', variable: 'my_docker_cerd')]) {
                        
                        sh "docker login -u kallepalli -p ${my_docker_cerd}"
                    }
                        sh "docker push kallepalli/mynewimage:$BUILD_NUMBER"
                }
            }
        }
    }
}