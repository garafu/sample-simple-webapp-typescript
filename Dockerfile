# -----------------
# Stage 1: Build the application
# -----------------
FROM node:20 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# -----------------
# Stage 2: Serve the application
# -----------------
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Copy only the package.json and package-lock.json files
COPY --from=build /app/package*.json ./
RUN npm ci

# Copy only the build output from the previous stage
COPY --from=build /app/dist ./dist

# Expose the application port
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
