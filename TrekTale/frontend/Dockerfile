# Frontend Dockerfile
FROM node:18-alpine

WORKDIR /frontend

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build
ENV NODE_ENV=production
EXPOSE 5173

CMD ["npm", "run", "dev"]