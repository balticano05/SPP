FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y apache2 mariadb-server curl && \
    apt-get clean

RUN echo "<h1>Lab 4: Apache + MariaDB in Docker</h1>" > /var/www/html/index.html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

CMD ["sh", "-c", "service mariadb start && apachectl -D FOREGROUND"]