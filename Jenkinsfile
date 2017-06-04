pipeline {
  agent any
  stages {
    stage('git pull') {
      steps {
        git(url: 'https://github.com/marioluan/jenkinsci.git', branch: 'master', changelog: true)
      }
    }
    stage('docker build') {
      steps {
        sh 'docker build -t $DOCKER_IMAGE_NAME:latest docker/'
      }
    }
    stage('docker tag') {
      steps {
        sh 'docker tag $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG'
      }
    }
    stage('docker login') {
      steps {
        sh '''docker login \
  --username $DOCKER_HUB_USER \
  --password $DOCKER_HUB_PASSWD'''
      }
    }
    stage('docker push') {
      steps {
        sh '''docker push $DOCKER_IMAGE_NAME:latest
&& docker push $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG'''
      }
    }
  }
  environment {
    DOCKER_IMAGE_NAME = 'marioluan/jenkinsci-2.6.3-alpine'
    DOCKER_IMAGE_TAG = '0.0.1'
    DOCKER_HUB_USER = 'marioluan'
    DOCKER_HUB_PASSWD = ''
  }
}
