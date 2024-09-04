pipeline {
    agent any
    environment {
        // Database connection variables
        DB_HOST = 'localhost'
        DB_PORT = '3306'
        DB_NAME = 'qcm'
        DB_USER = 'root'
        DB_PASS = 'root'
    }
    stages {
        stage('Checkout SCM') {
            steps {
                deleteDir()
                checkout scm
            }
        }
        stage('Start Database') {
            steps {
                // Start a MySQL container using Docker
                sh '''
                docker run -d --name mysql -e MYSQL_DATABASE=${DB_NAME} -e MYSQL_USER=${DB_USER} -e MYSQL_PASSWORD=${DB_PASS} -e MYSQL_ROOT_PASSWORD=rootpass -p ${DB_PORT}:3306 mysql:latest
                '''
                // Wait for the database to be ready
                sleep 20 // Adjust this if needed for the database to be fully up and running
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Docker Image') {
            steps {
                script {
                    sh 'docker build -t qcm/qcmservice .'
                }
            }
        }
    }
}
