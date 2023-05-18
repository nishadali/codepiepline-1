pipeline {
    agent {
        // Define agent details here
        any
    }
    environment {
        AQUA_REG_USERNAME     = credentials('AQUA_REG_USERNAME')
        AQUA_REG_PASSWORD = credentials('AQUA_REG_PASSWORD')
        AQUA_REGISTRY = "https://registry.aquasec.com"
    }
    stages {
        stage('Loginto AquaRegistry') {
            steps {
                docker login ${AQUA_REGISTRY} -u ${AQUA_REG_USERNAME} -p ${AQUA_REG_PASSWORD}
            }
        }
        // stage('CheckoutfromGit') {
        //     steps {
        //         // checkout Docker file from SCM
        //         git branch: 
        //         url https://
        //     }
        // }
        // stage('BuildDockerImage') {
        //     steps {
        //         //
        //     }
        // }
        // stage('AquaScan') {
        //     steps {
        //         aquaScan()
        //     }
        // }
    }
}
