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
            // For scanner Image to be pulled to Aqua Node
            steps {
                sh 'docker login $AQUA_REGISTRY -u $AQUA_REG_USERNAME -p $AQUA_REG_PASSWORD'
            }
        }
        stage('BuildDockerImage') {
            steps {
                script {
                    dockerImage = docker.build("nishadali/aqua-test:${env.BUILD_ID}")
                }
            }
        }
        stage('AquaScan_as_LocalImage') {
            steps {
                script {
                    aqua containerRuntime: 'docker', customFlags: '--layer-vulnerabilities --collect-sensitive --scan-malware --html', hideBase: false, hostedImage: '', localImage: 'nishadali/aqua-test:${BUILD_ID}', localToken: '', locationType: 'local', notCompliesCmd: '', onDisallowed: 'ignore', policies: '', register: false, registry: '', scannerPath: '', showNegligible: false, tarFilePath: ''
                }
            }
        }
        stage('Push_image') {
            steps {
                sh 'docker login https://docker.io/ -u nishadali -p Nishad@ce123'
                  sh  'docker tag nishadali/aqua-test:${BUILD_ID} nishadali/aqua-test:27-hosted'
                sh 'docker push nishadali/aqua-test:27-hosted'
                }
         }
        stage('Aqua_scan_as_HostedImage_webhook') {
        steps{
            sh 'echo Hosted Image scan'
            script {
                aqua containerRuntime: 'docker', customFlags: '--layer-vulnerabilities --collect-sensitive --scan-malware --html', hideBase: false, hostedImage: 'nishadali/aqua-test:27-hosted', localImage: '', localToken: '', locationType: 'hosted', notCompliesCmd: '', onDisallowed: 'ignore', policies: '', register: false, registry: 'nishad-docker', scannerPath: '', showNegligible: false, tarFilePath: ''
            }
        }
    }
}
}