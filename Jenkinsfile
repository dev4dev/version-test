pipeline{
    agent{
        label "xcode"
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
                sh "echo ${PROJECT_BUILD_NUMBER}"
            }
        }

        stage("Staging") {
            steps {
                sh "echo ${PROJECT_BUILD_NUMBER}"
            }
        }

        stage("Appstore") {
            steps {
                sh "echo ${PROJECT_BUILD_NUMBER}"
            }
        }
    }
}