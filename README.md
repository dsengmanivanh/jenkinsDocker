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

## On Kubernetes

service -> deployment -> replicat -> pod

Create a Pod

```
$ kubectl create -f jenkins-pod-security.yaml
```

Deploy a Pod

```
$ kubectl create -f jenkins-deployment.yaml
```
this command line create a deployment. No need to create replicat

Expose a Pod 
```
$ kubectl expose deployment/myjenkins-deployment --type="NodePort" --port=8080
```
this command line create a service

Inside a Pod
```
$ kubectl exec -it /myjenkins-deployment-bbfd6d55c-dh54c -- /bin/bash
```

Delete a deployment
```
$ kubectl delete deployment myjenkins-deployment
```


## Link

- [JenkinsFile](https://jenkins.io/doc/book/pipeline/jenkinsfile/)

- [Docker priveleged](https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities)

- [POD, NODE](https://kubernetes.io/docs/tutorials/kubernetes-basics/explore/explore-intro/)

- [Kubernetes Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

- [Kubernetes pod privileged](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)

