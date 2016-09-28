FROM php:7.0-cli

MAINTAINER Davi Marcondes Moreira <davi.marcondes.moreira@gmail.com>

ARG VCS_REF

LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="e.g. https://github.com/devdrops/docker-phpunit"

RUN curl --silent https://getcomposer.org/installer | php && \
    mv ./composer.phar /usr/local/bin/composer > /dev/null 2>&1

RUN apt-get update > /dev/null 2>&1
RUN apt-get install -y \
    git \
    zip \
    unzip \
    vim \
    curl > /dev/null 2>&1

RUN composer global require phpunit/phpunit && \
    ln -fs /root/.composer/vendor/bin/phpunit /usr/local/bin/phpunit > /dev/null 2>&1
