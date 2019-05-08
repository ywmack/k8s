#!/bin/bash
KUBE_VERSION=v1.12.1
KUBE_PAUSE_VERSION=3.1

ANJIA_URL=ywmack/
GCR_UR=k8s.gcr.io
 
images=(kube-proxy:${KUBE_VERSION}
pause:${KUBE_PAUSE_VERSION})

for imageName in ${images[@]} ; do
  docker pull $ANJIA_URL$imageName
  docker tag $ANJIA_URL$imageName $GCR_UR/$imageName
  docker rmi $ANJIA_URL$imageName
done