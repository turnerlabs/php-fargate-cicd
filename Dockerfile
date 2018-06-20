FROM quay.io/turner/fargate-cicd

RUN apt-get update -y && apt-get upgrade -y \
   && apt-get install -y python-software-properties \
   && add-apt-repository ppa:ondrej/php

RUN apt-get update -y \
    && apt-get install -y php7.2

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
