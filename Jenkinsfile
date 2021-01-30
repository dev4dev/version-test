pipeline{
    agent{
        label "xcode"
    }
    options {
        disableConcurrentBuilds()
    }
    environment {
        PROJECT_BUILD_NUMBER = """${sh(
                returnStdout: true,
                script: 'ruby get-version.rb'
            )}"""
    }
    stages {
        stage("Dev") {
            steps {
                sleep 10
                sh "echo ${PROJECT_BUILD_NUMBER}"
            }
        }

        stage("Staging") {
            steps {
                sleep 10
                sh "echo ${PROJECT_BUILD_NUMBER}"
            }
        }

        stage("Appstore") {
            steps {
                sleep 10
                sh "echo ${PROJECT_BUILD_NUMBER}"
            }
        }
    }
}