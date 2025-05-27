
# 🌍 TrekTale

**Share Your Journey, Inspire the World**

TrekTale is a cloud-powered, full-stack travel story platform that allows users to document and share their personal journeys with images, descriptions, and geotags. It is built using the MERN Stack and deployed on Google Cloud Platform using Docker and GKE.

---

## ✨ Live App

- 🌐 Frontend: [http://35.188.97.99:5173/login](http://35.188.97.99:5173/login)
- 🛠️ Backend API: [http://34.10.82.81:8000](http://34.10.82.81:8000)

Test Credentials:
```
Username: ram@gmail.com
Password: ram123
```

---

## 📸 Features

- User registration and authentication using JWT
- Creation of "TrekTales" with photo upload and rich-text descriptions
- Geotagging of trek locations
- Story filtering and discovery by location or tags
- Clean, responsive UI with a Progressive Web App experience

---

## 🧱 Technology Stack

| Layer       | Tech Stack                              |
|-------------|------------------------------------------|
| Frontend    | React.js, Vite, Tailwind CSS             |
| Backend     | Node.js, Express.js, Mongoose            |
| Database    | MongoDB Atlas                            |
| DevOps      | Docker, Docker Compose                   |
| Cloud       | Google Kubernetes Engine (GKE), GCP      |
| Config      | Kubernetes ConfigMap (from `.env`)       |

---

## 🏗️ Architecture Overview

- Frontend (React + Vite) and Backend (Express.js) run in **separate Docker containers**.
- Services are deployed on **GKE** with Kubernetes **LoadBalancer** (frontend) and **ClusterIP** (backend).
- Images are pulled from **Docker Hub**.
- Configuration values like `MONGO_URI` and `ACCESS_TOKEN_SECRET` are injected via **Kubernetes ConfigMaps**.

---

## 📂 Project Structure

```
TrekTale/
├── frontend/                    # Vite-based React app
│   ├── Dockerfile
│   ├── src/
├── backend/                     # Express.js backend
│   ├── Dockerfile
│   ├── index.js
│   ├── routes/
│   ├── models/
├── k8s/                         # Kubernetes manifests
│   ├── backend-deployment.yaml
│   ├── backend-service.yaml
│   ├── frontend-deployment.yaml
│   ├── frontend-service.yaml
│   └── configmap.yaml
├── .env
├── deploy.sh
└── README.md
```

---

## 🧪 Local Development

### Prerequisites
- Docker
- Node.js
- MongoDB URI (cloud/local)

### Steps
```bash
# Clone the repo
git clone https://github.com/AkashYadav4/TrekTale.git && cd TrekTale

# Add .env to backend/
MONGO_URI=your-mongodb-uri
ACCESS_TOKEN_SECRET=your-jwt-secret

# Start locally
docker compose up --build
```

- Frontend: `http://localhost:5173`
- Backend: `http://localhost:8000`

---

## ☁️ Production Deployment on GCP

### Step 1: Docker Build & Push

```bash
# Backend
docker build -t akash5468/trektale-backend:v1.6 ./backend --no-cache
docker push akash5468/trektale-backend:v1.6

# Frontend
docker build -t akash5468/trektale-frontend:v1.1 ./frontend --no-cache
docker push akash5468/trektale-frontend:v1.1
```

---

### Step 2: GKE Deployment

```bash
# Create ConfigMap from .env
kubectl delete configmap trektale-config --ignore-not-found
kubectl create configmap trektale-config --from-env-file=.env

# Apply backend
kubectl apply -f k8s/backend-deployment.yaml
kubectl apply -f k8s/backend-service.yaml

# Apply frontend
kubectl apply -f k8s/frontend-deployment.yaml
kubectl apply -f k8s/frontend-service.yaml
```

---

## 🧠 Troubleshooting

### ❌ Issue: Backend Crash on GKE
> Cause: `config.json` file missing during deployment

✅ **Fix:**  
- Replaced `config.json` with `.env` file  
- Created a **Kubernetes ConfigMap** from `.env`
- Mounted config via `envFrom.configMapRef` in `backend-deployment.yaml`

---

## ✅ Project Highlights

- Split app into frontend/backend microservices
- Used Docker Compose for local dev
- Containerized and deployed both services to **GKE**
- Secured and injected config via Kubernetes-native mechanisms
- Built a real-time cloud PWA with image upload and tagging

---

## 🙌 Author

**Akash Kumar Yadav**  
📍 Fordham University, New York  
✉️ akashkinu3@fordham.edu

---

## 📄 License

This project is licensed under the MIT License.
