minikube ssh
mkdir mnt/data

SECRETET FELRAKNI

FEL KELL RAKNI HELMET

kubectl create serviceaccount --namespace kube-system tiller

kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

helm init --service-account tiller --upgrade

helm install --name ingress-bende  stable/nginx-ingress --set rbac.create=true --set controller.publishService.enabled=true

ÍGY KONTROLLERT CSINÁLNI : https://cloud.google.com/community/tutorials/nginx-ingress-gke

kubectl create secret generic pgpassword --from-literal PGPASSWORD=mypgpassword123

If you add a standard pvc to GKE , you get a pv also.

## Cert manager:

kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.8/deploy/manifests/00-crds.yaml

kubectl create namespace cert-manager

kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true

helm repo add jetstack https://charts.jetstack.io

helm repo update

helm install   --name cert-manager   --namespace cert-manager   --version v0.8.1   jetstack/cert-manager

kubectl get pods --namespace cert-manager