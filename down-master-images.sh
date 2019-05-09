#!/bin/bash
KUBE_VERSION=v1.12.1
KUBE_PAUSE_VERSION=3.1
ETCD_VERSION=3.2.24
DNS_VERSION=1.2.2
 
YWMACK_URL=ywmack/google-k8s
GCR_UR=k8s.gcr.io
 
images=(kube-apiserver:${KUBE_VERSION}
kube-controller-manager:${KUBE_VERSION}
kube-scheduler:${KUBE_VERSION}
kube-proxy:${KUBE_VERSION}
pause:${KUBE_PAUSE_VERSION}
etcd:${ETCD_VERSION}
coredns:${DNS_VERSION})
 
for imageName in ${images[@]} ; do
  docker pull $YWMACK_URL.$imageName
  docker tag $YWMACK_URL.$imageName $GCR_UR/$imageName
  docker rmi $YWMACK_URL.$imageName
done
