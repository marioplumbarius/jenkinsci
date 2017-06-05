pipeline {
    agent any

    parameters {
        string(name: "DOCKER_HUB_PASSWORD", description: "DOCKER_HUB_PASSWORD")
        string(name: "DOCKER_IMAGE_TAG",    description: "DOCKER_IMAGE_TAG")
        string(name: "DOCKER_CMDPREFIX",    description: "DOCKER_CMDPREFIX",    defaultValue: "sudo")
        string(name: "DOCKER_IMAGE_NAME",   description: "DOCKER_IMAGE_NAME",   defaultValue: "marioluan/jenkinsci-2.6.3-alpine")
        string(name: "DOCKER_HUB_USER",     description: "DOCKER_HUB_USER",     defaultValue: "marioluan")
        string(name: "APP_DIRECTORY",       description: "APP_DIRECTORY",       defaultValue: "jenkinsci")
    }

    stages {
        stage("clean up") {
            steps {
                sh "rm -rf ${params.APP_DIRECTORY} | exit 0"
            }
        }
        stage("git clone") {
            steps {
                sh "git clone https://github.com/marioluan/jenkinsci.git"
            }
        }
        stage("docker login") {
            steps {
                sh "${params.DOCKER_CMDPREFIX} docker login --username ${params.DOCKER_HUB_USER} --password ${params.DOCKER_HUB_PASSWORD}"
            }
        }
        stage("docker build") {
            steps {
                sh "${params.DOCKER_CMDPREFIX} docker build -t ${params.DOCKER_IMAGE_NAME}:latest ${params.APP_DIRECTORY}/docker/"
            }
        }
        stage("docker tag") {
            steps {
                sh "${params.DOCKER_CMDPREFIX} docker tag ${params.DOCKER_IMAGE_NAME}:latest ${params.DOCKER_IMAGE_NAME}:${params.DOCKER_IMAGE_TAG}"
            }
        }
        stage("docker push") {
            steps {
                sh "${params.DOCKER_CMDPREFIX} docker push ${params.DOCKER_IMAGE_NAME}:latest && docker push ${params.DOCKER_IMAGE_NAME}:${params.DOCKER_IMAGE_TAG}"
            }
        }
    }
}
