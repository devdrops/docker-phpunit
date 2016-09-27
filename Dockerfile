FROM php:7.0-cli

MAINTAINER Davi Marcondes Moreira <davi.marcondes.moreira@gmail.com>

RUN curl --silent https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer > /dev/null 2>&1

RUN composer global require phpunit/phpunit && \
    sudo ln -fs /root/.composer/vendor/bin/phpunit /usr/local/bin/phpunit
