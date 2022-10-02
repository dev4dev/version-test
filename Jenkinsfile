pipeline {
    agent any
    options {
        disableConcurrentBuilds()
        // Skip default checkout flow, the custom one will be performed in a "Checkout" step
        skipDefaultCheckout()
    }
    environment {
        // overwrite BUILD_NUMBER
        // BUILD_NUMBER = """${sh(
        //         returnStdout: true,
        //         script: 'ruby get-version.rb'
        //     )}""".trim()
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
                // checkout scm
                checkout([
                    $class: 'GitSCM',
                    branches: scm.branches,
                    doGenerateSubmoduleConfigurations: scm.doGenerateSubmoduleConfigurations,
                    extensions: scm.extensions + [
                        // Base Clone options
                        [
                            $class: 'CloneOption',
                            depth: 10,
                            noTags: false,
                            reference: '',
                            shallow: true
                        ],
                        // Git LFS
                        // [
                        //     $class: 'GitLFSPull'
                        // ],
                        // Submodules
                        [
                            $class: 'SubmoduleOption',
                            depth: 1,
                            disableSubmodules: false,
                            recursiveSubmodules: true,
                            reference: '',
                            shallow: true,
                            trackingSubmodules: false
                        ]
                    ],
                    userRemoteConfigs: scm.userRemoteConfigs
                ])

                script {
                    // overwrite BUILD_NUMBER with a custom value from our script
                    env.BUILD_NUMBER = "${sh(returnStdout: true, script: 'ruby ./scripts/get-version.rb').trim()}"
                }

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