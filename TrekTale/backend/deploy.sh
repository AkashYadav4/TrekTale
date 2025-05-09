#!/bin/bash
docker build -t akash5468/trektale-backend:v1.6 . --no-cache
docker push akash5468/trektale-backend:v1.6

# Ensure .env file is present in the current directory
kubectl delete configmap trektale-config --ignore-not-found
kubectl create configmap trektale-config --from-env-file=.env

kubectl apply -f backend-deployment.yaml
kubectl apply -f backend-service.yaml
kubectl get service trektale-backend-service  