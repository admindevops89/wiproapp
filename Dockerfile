FROM node:20-alpine as build
WORKDIR /flipkart
COPY package*.json .
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /flipkart/dist/flipkart/browser /usr/share/nginx/html
EXPOSE 80