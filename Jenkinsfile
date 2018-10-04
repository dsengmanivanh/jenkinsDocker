pipeline {
    agent any
    stages {
        stage ('Git checkout') {
            steps {
                git 'https://github.com/dsengmanivanh/inno-java-backend.git'                
            }
        }
        stage ('Build Docker image') {
            steps {
                withMaven(jdk: 'java-8', maven: 'mvn-3.5.4') {
                    sh "mvn clean install dockerfile:build"
                }
            }
        }
        stage ('Tag Docker image for IBM') {
            steps {
               sh 'docker tag innostarterkit/java-backend registry.eu-de.bluemix.net/inno/java-backend:latest'          
            }
        }
    }
}