#build phase
FROM node:16.13.0-alpine as builder
WORKDIR /app
COPY package.json .

RUN npm install 
COPY . .
RUN npm run build 

#run phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
