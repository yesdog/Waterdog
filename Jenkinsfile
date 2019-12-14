     pipeline {
         agent any
         tools {
             maven 'Maven'
             jdk 'JDK_8'
         }
         options {
             buildDiscarder(logRotator(artifactNumToKeepStr: '5'))
         }
         stages {
             stage ('Build') {
                 steps {
                     sh 'git config --global user.email "alemiz@mizerak.eu" \
                         && git config --global user.name "Alemiz112"'
                     sh "chmod +x ./scripts/jenkinsBuild.sh && ./scripts/jenkinsBuild.sh ${BUILD_ID}"

                     sh 'mvn clean package'
                 }
                 post {
                     success {
                         archiveArtifacts artifacts: 'Waterfall-Proxy/bootstrap/target/Waterdog*.jar', fingerprint: true
                     }
                 }
             }
         }

         post {
             always {
                 deleteDir()
             }
         }
     }