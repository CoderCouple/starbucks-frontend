# This file demonstrate how perform a mutistage build

############################# Stage 1 - Build ######################

# fetch basic image
FROM node:alpine as build

# application placed into app/starbucks-frontend
WORKDIR /app/starbucks-frontend

# copy the package.json
COPY ./package*.json ./

# install dependencies
RUN npm install

# copy the source code
COPY ./ ./

# start up command
CMD ["npm","run","build"]

############################# Stage 2 - Deployment ######################

FROM nginx

EXPOSE 80

COPY --from=build /app/starbucks-frontend/build /usr/share/nginx/html

#Build the image
# docker build -t sunil28/starbucks-frontend .

#Run the image
# docker run -it -p 3000:80 sunil28/starbucks-frontend

#Enter into the container
# docker exec -it 3274b10d06ee /bin/bash