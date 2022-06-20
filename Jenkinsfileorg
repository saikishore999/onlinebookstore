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
        stage('Sonarqube Analysis') {
            environment {
              def scannerHome = tool 'SonarQubeScanner 9.5'
            }
            steps {  
                withSonarQubeEnv('sonarserver') {
                    sh "${scannerHome} mvn clean package sonar:sonar"
                        //sh "${scannerHome}/bin/sonar-scanner"
                    }
                sleep time: 30000, unit: 'MILLISECONDS'
                script {
                        def qg = waitForQualityGate()
                        if (qg.status != 'OK') {
                            error "Pipeline aborted due to quality gate failure: ${qg.status}"
                        }
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
                    
                    sh "docker run -itd --name mynewimage -p 8081:8080 kallepalli/mynewimage:${BUILD_NUMBER}"
             
                }
            }
        }
    }
}