FROM node:18-alpine

WORKDIR /app

RUN npm install -g live-server

EXPOSE 8080
CMD ["live-server", "--port=8080", "--host=0.0.0.0", "--watch=."] 
