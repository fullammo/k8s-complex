docker build -t fullammo/multi-client -f ./client/Dockerfile ./client
docker build -t fullammo/multi-server -f ./server/Dockerfile ./server
docker build -t fullammo/multi-worker -f ./worker/Dockerfile ./worker

docker push fullammo/multi-client
docker push fullammo/multi-server
docker push fullammo/multi-worker