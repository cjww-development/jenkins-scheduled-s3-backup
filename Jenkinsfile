pipeline {
  agent any
  environment {

  }
  stages {
    stage('Ensure bucket exists') {
      steps {
        echo "Running terraform"
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