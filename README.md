# Jenkins with Docker

This is a Jenkins with Docker inside. This allow you to build image and push on docker hub

## Installation

```
$ docker build -t myjenkins .
```

## Running Locally

```
$ docker run --privileged -p 8080:8080 -p 50000:50000 -v /home/pole-emploifr/Project/sandbox/docker/jenkins/home:/var/jenkins_home myjenkins
```

privileged => very important ! it allow you to start docker inside docker


## Last Step

```
$ docker exec -it -u root <containerId> bash
$ service docker start
$ docker info
$ docker images
```

## Link

- [JenkinsFile](https://jenkins.io/doc/book/pipeline/jenkinsfile/)

- [Docker priveleged](https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities)