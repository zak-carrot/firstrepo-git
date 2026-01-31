FROM centos:7

LABEL maintainer="parttimewarrior34@gmail.com"

# Install required packages
RUN yum -y update && \
    yum install -y httpd unzip && \
    yum clean all

# Apache document root
WORKDIR /var/www/html

# Copy the template zip from local machine
COPY photogenic.zip /var/www/html/

# Extract template and clean up
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose Apache port
EXPOSE 80

# Run Apache in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
