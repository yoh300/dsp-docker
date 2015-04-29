FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y curl apache2 php5 php5-common php5-cli php5-curl php5-json php5-mcrypt php5-gd php5-mysql mysql-client git php-pear php5-dev

RUN pecl install mongo

RUN mkdir -p /opt/dreamfactory/platform && \
    chmod 777 /opt/dreamfactory/platform

RUN git clone https://github.com/dreamfactorysoftware/dsp-core.git /opt/dreamfactory/platform

WORKDIR /opt/dreamfactory/platform

RUN scripts/installer.sh –cv

RUN a2enmod rewrite

RUN chmod 775 /opt/dreamfactory/platform/web/assets/

RUN rm /etc/apache2/sites-enabled/000-default.conf

RUN php5enmod mcrypt

ADD database.config.php /opt/dreamfactory/platform/config/database.config.php

ADD dsp.conf /etc/apache2/sites-available/dsp.conf
RUN a2ensite dsp

VOLUME ["/var/log/apache2", "/opt/dreamfactory/platform"]

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80
