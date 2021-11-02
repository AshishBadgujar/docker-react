#build phase
FROM node:17.0.1-alpine as builder
WORKDIR /app
COPY package.json .
RUN export NODE_OPTIONS=--openssl-legacy-provider
RUN npm install 
COPY . .
RUN npm run build 

#run phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]