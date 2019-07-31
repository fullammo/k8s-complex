SECRETET FELRAKNI

FEL KELL RAKNI HELMET

kubectl create serviceaccount --namespace kube-system tiller

kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

helm init --service-account tiller --upgrade

helm install --name ingress-bende  stable/nginx-ingress --set rbac.create=true --set controller.publishService.enabled=true

ÍGY KONTROLLERT CSINÁLNI : https://cloud.google.com/community/tutorials/nginx-ingress-gke

kubectl create secret generic pgpassword --from-literal PGPASSWORD=mypgpassword123


