# Use ultra-lightweight Nginx web server image
FROM nginx:alpine

# Remove default Nginx home page files
RUN rm -rf /usr/share/nginx/html/*

# Copy our custom website code into Nginx default web directory
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/

# Expose port 80 inside container
EXPOSE 80

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]