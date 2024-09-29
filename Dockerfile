FROM nginx:stable-alpine3.20-perl

# Copy html file from host computer to container
COPY index.html /usr/share/nginx/html/

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]

#expose port
EXPOSE 1918