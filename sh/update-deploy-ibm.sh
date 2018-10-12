#!/bin/sh
# This is a comment!
bx cs cluster-config mycluster
export KUBECONFIG=/root/.bluemix/plugins/container-service/clusters/mycluster/kube-config-mil01-mycluster.yml
kubectl set image deployment/$1 $1=registry.eu-de.bluemix.net/inno/$1:$2 --record
kubectl rollout history deployments $1
kubectl get rs
kubectl describe service $1
