FROM jenkins/jenkins:latest
MAINTAINER InnoStarterKit
USER root

ADD sh/docker-start.sh docker-start.sh
ADD sh/deploy-ibm.sh deploy-ibm.sh
ADD sh/update-deploy-ibm.sh update-deploy-ibm.sh

# Install the latest Docker CE binaries
RUN apt-get update && \
  apt-get -y install apt-transport-https \
  ca-certificates \
  curl \
  gnupg2 \
  software-properties-common && \
  curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
  add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
  $(lsb_release -cs) \
  stable" && \
  apt-get update && \
  apt-get -y install docker-ce

RUN apt-get update && \
  apt-get install -y vim

RUN curl -sL https://ibm.biz/idt-installer | bash && \
  apt-get update && \
  ibmcloud api https://api.eu-de.bluemix.net
