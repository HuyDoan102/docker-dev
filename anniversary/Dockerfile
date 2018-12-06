FROM amazonlinux:1

# Install PHP packages
RUN yum install -y \
    httpd24 \
    mysql \
    php71 \
    php71-cli \
    php71-common \
    php71-json \
    php71-mbstring \
    php71-mysqlnd \
    php71-pdo \
    php71-process \
    php71-xml

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# anniversary settings
ADD anniversary.conf /etc/httpd/conf.d/anniversary.conf

# Create User
ARG APP_USER=anniversary
ARG PUID=1000
ARG PGID=1000

ENV PUID ${PUID}
ENV PGID ${PGID}
ENV APP_USER ${APP_USER}

RUN groupadd --gid ${PGID} ${APP_USER} && \
  useradd --uid ${PUID} --gid ${APP_USER} --shell /bin/bash --create-home ${APP_USER} && \
  echo "${APP_USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Set permission for APP_USER
RUN chown -R ${APP_USER}:${APP_USER} /var/www/html

ENV HOME /home/${APP_USER}

WORKDIR /var/www/html/anniversary
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
