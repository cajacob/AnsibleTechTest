FROM library/alpine

# Install Nginx.
RUN \
  apk add --update && \ 
  apk add --nocache nginx bash && \ 
  adduser -D -g 'www' www &&\
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  mkdir /www &&\
  chown -R www:www  /var/lib/nginx && \ 
  chown -R www:www  /www

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443