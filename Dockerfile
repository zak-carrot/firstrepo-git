FROM rockylinux:9

LABEL maintainer="parttimewarrior34@gmail.com"

# Install required packages
RUN dnf -y update && \
    dnf -y install httpd && \
    dnf clean all

# Apache document root
WORKDIR /var/www/html

COPY 2151_winter_gallery/ /var/www/html/

RUN chown -R apache:apache /var/www/html

# Expose Apache port
EXPOSE 80 22

# Run Apache in foregroud

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
