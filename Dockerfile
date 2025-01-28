 # Use an official Nginx image to serve the React build         
FROM nginx:stable-alpine    
 
# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Copy the extracted React build artifact into the Nginx web directory
COPY extracted-package/ .

# Remove the default Nginx configuration file if it exists
RUN rm /etc/nginx/conf.d/default.conf || true

# Add a custom Nginx configuration to listen on port 8001
COPY extracted-package/build/nginx.conf /etc/nginx/conf.d/

# Expose port 8001 for the Nginx server
EXPOSE 8001

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
