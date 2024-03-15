FROM nginx:latest

#COPY ... in case I wanted to copy files or directories from src and adds them to the filesystem oof the container at the path dest

COPY nginx.conf etc/nginx/nginx.conf

EXPOSE 80

#RUN ... in case I wanted to run a service inside a shell inside our container


CMD ["nginx", "-g", "daemon off;"]