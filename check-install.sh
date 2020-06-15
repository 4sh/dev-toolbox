#!/bin/bash

echo "\n----- sdk version"
sdk version
echo "\n----- java version"
java -version
echo "\n----- git version"
git version
echo "\n----- docker version"
docker version
echo "\n----- gcloud version"
gcloud version
echo "\n----- kubectl version"
kubectl version
echo "\n----- kubectl krew version"
k krew version
echo "\n----- kustomize version"
kustomize version
echo "\n----- helm version"
helm version
echo "\n----- stern version"
stern --version
  
  
echo "\n----- git config"
echo "user = $(git config user.name) - user email = $(git config user.email)"
  
echo "\n----- kubectl quatreeapp context"
(k ctx | grep quatreapp) || echo "
FAILED - k ctx failed
 
maybe you didn't install ctx plugin with k krew install ctx
 
please double check the installation instructions here:
  https://unison.4sh.fr/display/4DEV/kubectl"
  
echo "\n----- kubectl namespaces"
k ns | head
  
echo "\n----- docker artifact registry access"
(
 export DOCKER_CLI_EXPERIMENTAL=enabled
 docker manifest inspect europe-docker.pkg.dev/quatreapp/k8straining/myapp-srv-xhn:latest > /dev/null \
     && echo "docker artifact registry ok") || echo "
FAILED - docker artifact registry access failed
 
please verify that you have properly configure docker to access europe-docker.pkg.dev
   gcloud auth configure-docker europe-docker.pkg.dev
 
see instructions here:
  https://unison.4sh.fr/display/4DEV/gcloud
"
