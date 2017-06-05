pipeline {
    agent any

    parameters {
        string(name: "DOCKER_HUB_USER",     description: "DOCKER_HUB_USER",     defaultValue: "marioluan")
        string(name: "DOCKER_HUB_PASSWORD", description: "DOCKER_HUB_PASSWORD")
        string(name: "DOCKER_IMAGE_NAME",   description: "DOCKER_IMAGE_NAME",   defaultValue: "marioluan/jenkinsci-2.6.3-alpine")
        string(name: "DOCKER_IMAGE_TAG",    description: "DOCKER_IMAGE_TAG")
        string(name: "DOCKER_CMD_PREFIX",   description: "DOCKER_CMD_PREFIX",   defaultValue: "sudo")
    }

    stages {
        stage("git clone") {
            steps {
                git(url: 'https://github.com/marioluan/jenkinsci.git', branch: 'master', changelog: true)
            }
        }
        stage("docker login") {
            steps {
                sh "${params.DOCKER_CMD_PREFIX} docker login --username ${params.DOCKER_HUB_USER} --password ${params.DOCKER_HUB_PASSWORD}"
            }
        }
        stage("docker build") {
            steps {
                sh "${params.DOCKER_CMD_PREFIX} docker build -t ${params.DOCKER_IMAGE_NAME}:latest docker/"
            }
        }
        stage("docker tag") {
            steps {
                sh "${params.DOCKER_CMD_PREFIX} docker tag ${params.DOCKER_IMAGE_NAME}:latest ${params.DOCKER_IMAGE_NAME}:${params.DOCKER_IMAGE_TAG}"
            }
        }
        stage("docker push") {
            steps {
                sh "${params.DOCKER_CMD_PREFIX} docker push ${params.DOCKER_IMAGE_NAME}:latest && ${params.DOCKER_CMD_PREFIX} docker push ${params.DOCKER_IMAGE_NAME}:${params.DOCKER_IMAGE_TAG}"
            }
        }
    }

    post {
        always {
            echo "cleaning up"
            deleteDir()
        }
    }
}
