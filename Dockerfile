# This file demonstrate how perform a mutistage build

############################# Stage 1 - Build ######################

# fetch basic image
FROM node:alpine

# application placed into app/starbucks-frontend
WORKDIR /app/starbucks-frontend

# copy the package.json
COPY ./package.json ./

# install dependencies
RUN npm install

# copy the source code
COPY ./ ./

# start up command
CMD ["npm","start"]

############################# Stage 2 - Deployment ######################



#Build the image
# docker build -t sunil28/starbucks-frontend .

#Run the image
# docker run -it -p 3000:3000 sunil28/starbucks-frontend

#Enter into the container
# docker exec -it 3274b10d06ee /bin/bash