#!/bin/sh
# This is a comment!
bx cs cluster-config mycluster
export KUBECONFIG=/root/.bluemix/plugins/container-service/clusters/mycluster/kube-config-mil01-mycluster.yml
kubectl run $1 --image=registry.eu-de.bluemix.net/inno/$1:$2 --record
kubectl expose deployment/$1 --type="NodePort" --port=8080
kubectl describe service $1
