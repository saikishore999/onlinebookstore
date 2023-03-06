pipeline{
    agent any
    stages{
        stage("build as code"){
            steps{
                sh 'mvn clean install'
            }
        }
    }
}