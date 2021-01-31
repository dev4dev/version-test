pipeline {
    agent{
        label "xcode"
    }
    options {
        disableConcurrentBuilds()
    }
    environment {
        // overwrite BUILD_NUMBER
        BUILD_NUMBER = """${sh(
                returnStdout: true,
                script: 'ruby get-version.rb'
            )}"""
    }
    
    stages {
        // stage("Dev") {
        //     steps {
        //         milestone("${PROJECT_BUILD_NUMBER}" as Integer)
        //         lock(resource: "builder_${env.NODE_NAME}", inversePrecedence: true) {
        //             // https://www.jenkins.io/blog/2016/10/16/stage-lock-milestone/
        //             // https://www.jenkins.io/doc/pipeline/steps/pipeline-milestone-step/
        //             sleep 180
        //             sh "echo ${PROJECT_BUILD_NUMBER}"
        //         }
        //     }
        // }

        stage("Dev") {
            steps {
                sleep 60
                sh "echo \"${BUILD_NUMBER}\""
            }
        }

        stage("Staging") {
            steps {
                sleep 60
                sh "echo ${BUILD_NUMBER}"
            }
        }

        // stage("Appstore") {
        //     steps {
        //         sleep 60
        //         sh "echo ${PROJECT_BUILD_NUMBER}"
        //     }
        // }
}
}