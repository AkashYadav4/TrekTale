# Backend Dockerfile
FROM node:18-alpine

WORKDIR /backend

COPY package*.json ./
RUN npm install

COPY . .

ENV NODE_ENV=development
EXPOSE 8000

CMD ["npm", "start"]
