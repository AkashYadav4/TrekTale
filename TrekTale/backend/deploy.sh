#!/bin/bash
docker build -t akash5468/trektale-backend:v1.1 . --no-cache
docker push akash5468/trektale-backend:v1.1

kubectl create configmap trektale-config --from-file=.env
kubectl apply -f backend-deployment.yaml
kubectl apply -f backend-service.yaml
kubectl get service trektale-backend-service  