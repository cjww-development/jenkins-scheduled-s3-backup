pipeline {
  agent any
  parameters {
    booleanParam(name: 'Versioned', defaultValue: false, description: 'Create versioned jenkins backups or not')
  }
  stages {
    stage('Ensure bucket exists') {
      steps {
        script {
          withCredentials([string(credentialsId: 'jenkins_backup_bucket', variable: 'BUCKET_NAME'), string(credentialsId: 'aws-access-key', variable: 'AWS_KEY'), string(credentialsId: 'aws-secret-key', variable: 'AWS_SEC')]) {
            sh '''
              export TF_VAR_bucket_name=$BUCKET_NAME
              export AWS_ACCESS_KEY_ID=$AWS_KEY
              export AWS_SECRET_ACCESS_KEY=$AWS_SEC
              cd terraform
              terraform init
              terraform apply --auto-approve || true
            '''
          }
        }
      }
    }
    stage('Archive Jenkins home') {
      steps {
        script {
//           if(env.Versioned == "true") {
//             sh "archiving/versioned-archive.sh"
//           } else {
//             sh "archiving/archive.sh"
//           }
          sh '''
          ls -al
          tar -czvf jenkins_backup.tar $JENKINS_HOME
          '''
        }
      }
    }
    stage('Pushing archive to S3') {
      steps {
        echo "Pushing $JENKINS_HOME backup to S3"
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}