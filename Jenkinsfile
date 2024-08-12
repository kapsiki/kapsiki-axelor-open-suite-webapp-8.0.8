pipeline {
    agent any

    stages {
       stage('Git Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/kapsiki/kapsiki-axelor-open-suite-webapp-8.0.8.git'
               }
            }

        stage('Build') {
            steps {
                sh './gradlew clean build -x test'
            }
        }

        stage('Docker Compose') {
            steps {
                    sh 'docker-compose down -v'
                    sh 'docker-compose up --build -d'
                }
        }
    }
}
