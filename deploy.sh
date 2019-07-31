docker build -t fullammo/multi-client:latest -t fullammo/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t fullammo/multi-server:latest -t fullammo/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t fullammo/multi-worker:latest -t fullammo/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push fullammo/multi-client:latest
docker push fullammo/multi-server:latest
docker push fullammo/multi-worker:latest

docker push fullammo/multi-client:$SHA
docker push fullammo/multi-server:$SHA
docker push fullammo/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=fullammo/multi-client:$SHA
kubectl set image deployments/server-deployment server=fullammo/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=fullammo/multi-worker:$SHA

#kubectl rollout restart deployment/server-deployment
#kubectl rollout restart deployment/client-deployment
#kubectl rollout restart deployment/worker-deployment