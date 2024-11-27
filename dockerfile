# Use Alpine with Node 18 as parent image
FROM node:18-alpine

# Change the working directory on the Docker image to /app
WORKDIR /usr/src/app

# Copy package.json and yarn.lock to the /app directory
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of project files into this image
COPY . .

# Expose application port
EXPOSE 8080

# Run the build script to transpile
RUN yarn build

# Start the application
CMD ["yarn", "start"]
