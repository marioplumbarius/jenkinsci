FROM jenkinsci/jenkins:2.63-alpine

MAINTAINER Mario Luan <mariosouzaluan@gmail.com>

# installs sudo, in order to let jenkins execute docker commands
USER root
RUN apk add --no-cache sudo
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

ENV DOCKER_VERSION 1.13.1
# installs docker-cli
RUN curl -o /tmp/docker.tgz "https://get.docker.com/builds/Linux/x86_64/docker-$DOCKER_VERSION.tgz "\
    && tar -xf /tmp/docker.tgz \
    && cp docker/docker /usr/bin/docker \
    && rm -rf /tmp/docker.tgz docker/docker

USER jenkins
COPY var/jenkins_home/log.properties                            var/jenkins_home/log.properties
COPY usr/share/jenkins/ref/init.groovy.d/custom.groovy          /usr/share/jenkins/ref/init.groovy.d/custom.groovy
COPY usr/share/jenkins/ref/init.groovy.d/executors.groovy       /usr/share/jenkins/ref/init.groovy.d/executors.groovy
COPY usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state  /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
