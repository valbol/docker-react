FROM node:16-alpine as builder
WORKDIR '/app'
COPY . .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html
# NO need for start command -- Defualt command will start ngnix automatically in the ngnix image

