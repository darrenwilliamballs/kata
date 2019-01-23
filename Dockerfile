FROM node:8.9.1-alpine

# Create app dir
RUN mkdir -p /usr/src/webapp
WORKDIR /usr/src/webapp

# Install deps
RUN apk update && apk upgrade && apk add git

COPY package*.json /usr/src/webapp/
RUN npm install
# If building for production:
# RUN npm install --only=production
COPY . /usr/src/webapp/

ENV HOST 0.0.0.0
EXPOSE 3000

# Start command
CMD [ "npm", "run", "dev", "-- --SPA" ]

