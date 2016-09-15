FROM ubuntu:14.04

MAINTAINER Davi Marcondes Moreira <davi.marcondes.moreira@gmail.com>

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update > /dev/null 2>&1
RUN apt-get -y install \
    vim \
    curl\
    build-essential \
    software-properties-common \
    python-software-properties \
    git
RUN add-apt-repository ppa:ondrej/php5-5.6
RUN apt-get update > /dev/null 2>&1

RUN apt-get -y install \
    php5 \
    php5-curl \
    php5-gd \
    php5-mcrypt \
    php-apc

RUN curl --silent https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

RUN composer global require 'phpunit/phpunit=5.1.*' && \
    sudo ln -fs /root/.config/composer/vendor/bin/phpunit /usr/local/bin/phpunit

CMD [ "php" ]
