FROM php:5.6-apache

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils zip mcrypt memcached libmcrypt-dev libcurl3-dev zlibc git
RUN apt-get install -y php5-mcrypt php5-memcache php5-memcached php5-mysql
RUN apt-get autoremove -y

COPY config/000-default.conf /etc/apache2/sites-available/
COPY config/php.ini-apache2 /usr/local/etc/php/php.ini
COPY config/php.ini-cli /etc/php5/cli/php.ini
COPY config/apache2.conf /etc/apache2/apache2.conf

