FROM node:latest as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build 


FROM nginx:latest
COPY --from=build app/dist/electric-equipment-ui usr/share/nginx/html
EXPOSE 80