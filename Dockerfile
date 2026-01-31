FROM ubuntu:22.04

LABEL maintainer="parttimewarrior34@gmail.com"

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache and unzip
RUN apt-get update && \
    apt-get install -y apache2 unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy website content
COPY html/ /var/www/html/

# Correct permissions
RUN chown -R www-data:www-data /var/www/html

# Expose HTTP port
EXPOSE 80

# Run Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]
