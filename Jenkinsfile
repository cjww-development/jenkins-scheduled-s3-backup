pipeline {
  agent any
  environment {
    REPLACE=true
    AWS_ACCESS_KEY_ID=credential('aws-access-key')
    AWS_SECRET_ACCESS_KEY=credential('aws-secret-key')
  }
  stages {
    stage('Ensure bucket exists') {
      steps {
        cd terraform
        terraform init
        terraform apply
      }
    }
    stage('Archive Jenkins home') {
      steps {
        echo "Archiving $JENKINS_HOME"
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