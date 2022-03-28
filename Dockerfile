FROM node:16.13.2-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
Expose 80
COPY --from=builder /app/build /usr/share/nginx/html