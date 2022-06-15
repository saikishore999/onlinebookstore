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
                    withCredentials([string(credentialsId: 'kallepalli', variable: 'docker_my')]) {
                         
                    sh "docker login -u kallepalli -p ${docker_my}"
                    }
                     sh "docker push kallepalli/mynewimage:$BUILD_NUMBER"
                }
            }
        }
        stage("run image as container"){
            steps{
                script{
                    def dockerRun="docker run -itd --name mynewimage -p 8081:8080 kallepalli/mynewimage:${BUILD_NUMBER}"
                    sshagent(['dev_server']) {
                        sh "ssh -o StrictHostKeyChecking=no ununtu@54.234.212.180 ${dockerRun}"
             
                        }
                    
                }
            }
        }
    }
}