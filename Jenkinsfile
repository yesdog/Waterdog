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
                     sh 'git config --global user.email "crgodsey@gmail.com" \
                         && git config --global user.name "colinrgodsey"'
                     sh 'git submodule update --init && ./scripts/applyPatches.sh'

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