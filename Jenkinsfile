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

                     sh 'mvn clean -B clean -DSNYK_API_ENDPOINT="https://snyk.io/" -Dbuild.number=${BUILD_NUMBER} install'
                 }
                 post {
                     success {
                         archiveArtifacts artifacts: 'Waterfall-Proxy/bootstrap/target/Waterdog*.jar,Waterfall-Proxy/module/cmd-server/target/cmd_server.jar,Waterfall-Proxy/module/cmd-list/target/cmd_list.jar,Waterfall-Proxy/module/reconnect-yaml/target/reconnect_yaml.jar,Waterfall-Proxy/module/cmd-find/target/cmd_find.jar,Waterfall-Proxy/module/cmd-send/target/cmd_send.jar,Waterfall-Proxy/module/cmd-alert/target/cmd_alert.jar', fingerprint: true
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