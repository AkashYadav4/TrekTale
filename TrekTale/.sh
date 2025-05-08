# Create a GKE Cluster
gcloud container clusters create trektale-cluster  --project=cisc5550-454815  --zone=us-central1-a --num-nodes=2 --machine-type=e2-small
gcloud components install gke-gcloud-auth-plugin

# Deploy to cluster
gcloud container clusters get-credentials trektale-cluster --region=us-central1-a --project=cisc5550-454815