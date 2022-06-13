pipeline{
    agent any
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
                    sh "docker build -t kallepalli/mynewimage . "
                }
            }
        }
    }
}