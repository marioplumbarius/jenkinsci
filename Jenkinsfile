pipeline {
    agent any

    options {
        timeout(time: 1, unit: 'MINUTES')
        buildDiscarder(
            logRotator(
                artifactNumToKeepStr: '3',
                numToKeepStr: '3'
            )
        )
        disableConcurrentBuilds()
    }

    parameters {
        string(name: "APP_NAME",            description: "APP_NAME",            defaultValue: "jenkinsci")
        string(name: "DOCKER_HUB_USER",     description: "DOCKER_HUB_USER",     defaultValue: "marioluan")
        string(name: "DOCKER_HUB_PASSWORD", description: "DOCKER_HUB_PASSWORD")
        string(name: "DOCKER_IMAGE_NAME",   description: "DOCKER_IMAGE_NAME",   defaultValue: "marioluan/jenkinsci-2.6.3-alpine")
        string(name: "DOCKER_IMAGE_TAG",    description: "DOCKER_IMAGE_TAG")
        string(name: "DOCKER_CMD_PREFIX",   description: "DOCKER_CMD_PREFIX",   defaultValue: "sudo")
        string(name: "APP_PRIVATE_IP",      description: "APP_PRIVATE_IP",      defaultValue: "172.31.74.91")
    }

    stages {
        stage("clean up") {
            steps {
                deleteDir()
            }
        }
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

        stage('deploy check') {
            steps {
                input "Do you want to deploy?"
            }
        }

        stage("before-deploy") {
            steps {
                sh "ssh -i ~/.ssh/terraform centos@${params.APP_PRIVATE_IP} rm docker-stack.yml"
                sh "ssh -i ~/.ssh/terraform centos@${params.APP_PRIVATE_IP} curl -o docker-stack.yml https://raw.githubusercontent.com/marioluan/jenkinsci/master/docker/docker-stack.yml"
            }
        }
        stage("deploy") {
            steps {
                sh "ssh -i ~/.ssh/terraform centos@${params.APP_PRIVATE_IP} docker stack -c docker-stack.yml deploy ${params.APP_NAME}"
            }
        }
    }
}
