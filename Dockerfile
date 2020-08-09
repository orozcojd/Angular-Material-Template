FROM node:14-alpine as builder

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/dist/angular-template /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]

