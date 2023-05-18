pipeline {
    agent any
    
    environment {
        AQUA_REG_USERNAME     = credentials('AQUA_REG_USERNAME')
        AQUA_REG_PASSWORD = credentials('AQUA_REG_PASSWORD')
        AQUA_REGISTRY = "https://registry.aquasec.com"
        dockerImage = ''
    }
    stages {
        stage('Loginto AquaRegistry') {
            steps {
                sh 'docker login $AQUA_REGISTRY -u $AQUA_REG_USERNAME -p $AQUA_REG_PASSWORD'
            }
        }
        // stage('CheckoutfromGit') {
        //   steps {
        //     script {
        //        checkout SCM
        //     }
        // //         git branch 'Aqua-test', url 'https://github.com/nishadali/codepiepline-1.git'   
        // }
        // }
        stage('BuildDockerImage') {
            steps {
                script {
                    dockerImage = docker.build("nishadali/aqua-test:${env.BUILD_ID}")
                }
            }
        }
        stage('AquaScan') {
            steps {
                script {
                    aqua containerRuntime: 'docker', customFlags: '', hideBase: false, hostedImage: '', localImage: 'nishadali/aqua-test:${env.BUILD_ID}', localToken: '', locationType: 'local', notCompliesCmd: '', onDisallowed: 'ignore', policies: '', register: false, registry: '', scannerPath: '', showNegligible: false, tarFilePath: ''
                }
            }
        }
    }
}
