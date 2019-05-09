#!/bin/bash
KUBE_VERSION=v1.12.1
KUBE_PAUSE_VERSION=3.1
DASHBOARD_VERSION=v1.10.1

YWMACK_URL=ywmack/google-k8s
GCR_UR=k8s.gcr.io
 
images=(kube-proxy:${KUBE_VERSION}
pause:${KUBE_PAUSE_VERSION}
kubernetes-dashboard-amd64:${DASHBOARD_VERSION})

for imageName in ${images[@]} ; do
  docker pull $YWMACK_URL.$imageName
  docker tag $YWMACK_URL.$imageName $GCR_UR/$imageName
  docker rmi $YWMACK_URL.$imageName
done
