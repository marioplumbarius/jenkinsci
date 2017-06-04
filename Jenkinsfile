pipeline {
  agent any

  environment {
    CMD_PREFIX = "ssh -i ~/.ssh/terraform centos@172.31.74.91"
    DOCKER_IMAGE_NAME = "marioluan/jenkinsci-2.6.3-alpine"
    DOCKER_IMAGE_TAG = "0.0.1"
    DOCKER_HUB_USER = "marioluan"
    JENKINSCI_DIRECTORY = "jenkinsci"
  }
  parameters {
    string(name: 'DOCKER_HUB_PASSWORD', description: 'DOCKER_HUB_PASSWORD')
  }

  stages {
    stage("clean up") {
      steps {
        sh "$CMD_PREFIX rm -rf $JENKINSCI_DIRECTORY | exit 0"
      }
    }
    stage("git clone") {
      steps {
        sh "$CMD_PREFIX git clone https://github.com/marioluan/jenkinsci.git"
      }
    }
    stage("docker build") {
      steps {
        sh "$CMD_PREFIX docker build -t $DOCKER_IMAGE_NAME:latest $JENKINSCI_DIRECTORY/docker/"
      }
    }
    stage("docker tag") {
      steps {
        sh "$CMD_PREFIX docker tag $DOCKER_IMAGE_NAME:latest $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG"
      }
    }
    stage("docker login") {
      steps {
        sh "$CMD_PREFIX docker login --username $DOCKER_HUB_USER --password ${params.DOCKER_HUB_PASSWORD}"
      }
    }
    stage("docker push") {
      steps {
        sh "$CMD_PREFIX 'docker push $DOCKER_IMAGE_NAME:latest && docker push $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG'"
      }
    }
  }
}
