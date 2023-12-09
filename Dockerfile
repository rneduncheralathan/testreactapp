FROM node:16.20.2 as build

# Set the working directory in the container
WORKDIR /testreactapp

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire application code to the container
COPY . .

# Build the React app for production
RUN npm run build

# Use Nginx as the production server
FROM nginx:alpine

# Copy the built React app to Nginx's web server directory
COPY --from=build /testreactapp/build /usr/share/nginx/html

# Expose port 80 for the Nginx server
EXPOSE 80