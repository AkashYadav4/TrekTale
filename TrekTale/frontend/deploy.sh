#!/bin/bash
docker build -t akash5468/trektale-frontend:v1.1 . --no-cache
docker push akash5468/trektale-frontend:v1.1

kubectl apply -f frontend-deployment.yaml
kubectl apply -f frontend-service.yaml
kubectl get service trektale-frontend-service