#!/bin/bash

echo "
----- java version"
java -version
echo "
----- git version"
git version
echo "
----- docker version"
docker version
echo "
----- gcloud version"
gcloud version
echo "
----- kubectl version"
kubectl version
echo "
----- kubectl krew version"
kubectl krew version
echo "
----- kustomize version"
kustomize version
echo "
----- helm version"
helm version
echo "
----- stern version"
stern --version
  
  
echo "
----- git config"
echo "user = $(git config user.name) - user email = $(git config user.email)"
  
echo "
----- kubectl quatreeapp context"
(kubectl ctx | grep quatreapp) || echo "
FAILED - k ctx failed
 
maybe you didn't install ctx plugin with k krew install ctx
 
please double check the installation instructions here:
  https://unison.4sh.fr/display/4DEV/kubectl"
  
echo "
----- kubectl namespaces"
kubectl ns | head
  
echo "
----- docker artifact registry access"
(
 export DOCKER_CLI_EXPERIMENTAL=enabled
 docker manifest inspect europe-docker.pkg.dev/quatreapp/k8straining/myapp-srv-xhn:latest > /dev/null \
     && echo "docker artifact registry ok") || echo "
FAILED - docker artifact registry access failed
 
please verify that you have properly configure docker to access europe-docker.pkg.dev
   gcloud login
   gcloud beta auth configure-docker europe-docker.pkg.dev
 
see instructions here:
  https://unison.4sh.fr/display/4DEV/gcloud
"

echo "

--------------------------------------------------------------------------------------------------
please check the output to see if everything is ok

you can have an example output here: 
   https://unison.4sh.fr/pages/viewpage.action?pageId=72319001

if a tool seem to not be properly installed, double check installation instructions here:
   https://unison.4sh.fr/display/4DEV/Tooling
--------------------------------------------------------------------------------------------------   
"
