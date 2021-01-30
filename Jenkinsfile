pipeline{
    agent{
        label "xcode"
    }
    // options {
    //     disableConcurrentBuilds()
    // }
    environment {
        PROJECT_BUILD_NUMBER = """${sh(
                returnStdout: true,
                script: 'ruby get-version.rb'
            )}"""
    }
    
    // https://www.jenkins.io/blog/2016/10/16/stage-lock-milestone/
    // https://www.jenkins.io/doc/pipeline/steps/pipeline-milestone-step/
    milestone "${PROJECT_BUILD_NUMBER}".toInteger()
    lock(resource: "builder_${env.NODE_NAME}", inversePrecedence: true) {
        stage("Dev") {
            steps {
                sleep 60
                sh "echo ${PROJECT_BUILD_NUMBER}"
            }
        }

        stage("Staging") {
            steps {
                sleep 60
                sh "echo ${PROJECT_BUILD_NUMBER}"
            }
        }

        stage("Appstore") {
            steps {
                sleep 60
                sh "echo ${PROJECT_BUILD_NUMBER}"
            }
        }
    }
}
