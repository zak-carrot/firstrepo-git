FROM centos:7

LABEL maintainer="parttimewarrior34@gmail.com"

# Install required packages
RUN yum -y update && \
    yum install -y httpd unzip && \
    yum clean all

# Apache document root
WORKDIR /var/www/html

# Copy the template zip from local machine
COPY html/ /var/www/html/


# Expose Apache port
EXPOSE 80

# Run Apache in foregroud
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
