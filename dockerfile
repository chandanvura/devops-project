# Base image — Node.js 18 lightweight version
FROM node:18-alpine

# Set working directory inside container
WORKDIR /app

# Copy package files first (layer caching — faster rebuilds)
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy rest of app code
COPY . .

# Expose port app runs on
EXPOSE 3000

# Command to start app
CMD ["node", "app.js"]