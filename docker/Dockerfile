FROM jenkinsci/jenkins:2.63-alpine

MAINTAINER Mario Luan <mariosouzaluan@gmail.com>

COPY var/jenkins_home/log.properties                            var/jenkins_home/log.properties
COPY usr/share/jenkins/ref/init.groovy.d/custom.groovy          /usr/share/jenkins/ref/init.groovy.d/custom.groovy
COPY usr/share/jenkins/ref/init.groovy.d/executors.groovy       /usr/share/jenkins/ref/init.groovy.d/executors.groovy
COPY usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state  /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state