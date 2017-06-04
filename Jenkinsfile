pipeline {
    agent any

    parameters {
        string(name: "DOCKER_HUB_PASSWORD", description: "DOCKER_HUB_PASSWORD")
        string(name: "DOCKER_IMAGE_TAG",    description: "DOCKER_IMAGE_TAG")
        string(name: "CMD_PREFIX",          description: "CMD_PREFIX",          defaultValue: "ssh -i ~/.ssh/terraform centos@172.31.74.91")
        string(name: "DOCKER_IMAGE_NAME",   description: "DOCKER_IMAGE_NAME",   defaultValue: "marioluan/jenkinsci-2.6.3-alpine")
        string(name: "DOCKER_HUB_USER",     description: "DOCKER_HUB_USER",     defaultValue: "marioluan")
        string(name: "JENKINSCI_DIRECTORY", description: "JENKINSCI_DIRECTORY", defaultValue: "jenkinsci")
    }

    stages {
        stage("clean up") {
            steps {
                sh "${params.CMD_PREFIX} rm -rf ${params.JENKINSCI_DIRECTORY} | exit 0"
            }
        }
        stage("git clone") {
            steps {
                sh "${params.CMD_PREFIX} git clone https://github.com/marioluan/jenkinsci.git"
            }
        }
        stage("docker login") {
            steps {
                sh "${params.CMD_PREFIX} docker login --username ${params.DOCKER_HUB_USER} --password ${params.DOCKER_HUB_PASSWORD}"
            }
        }
        stage("docker build") {
            steps {
                sh "${params.CMD_PREFIX} docker build -t ${params.DOCKER_IMAGE_NAME}:latest ${params.JENKINSCI_DIRECTORY}/docker/"
            }
        }
        stage("docker tag") {
            steps {
                sh "${params.CMD_PREFIX} docker tag ${params.DOCKER_IMAGE_NAME}:latest ${params.DOCKER_IMAGE_NAME}:${params.DOCKER_IMAGE_TAG}"
            }
        }
        stage("docker push") {
            steps {
                sh "${params.CMD_PREFIX} 'docker push ${params.DOCKER_IMAGE_NAME}:latest && docker push ${params.DOCKER_IMAGE_NAME}:${params.DOCKER_IMAGE_TAG}'"
            }
        }
    }
}
