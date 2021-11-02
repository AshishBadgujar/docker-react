#build phase
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install --silent
RUN npm install react-scripts@3.0.1 -g --silent 
COPY . .
RUN npm run build 

#run phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]