FROM quay.io/turner/fargate-cicd

RUN apt-get install -y php

RUN apt-get update && apt-get upgrade \
   && apt-get install python-software-properties \
   && add-apt-repository ppa:ondrej/php \

RUN apt-get update \
    && apt-get install php7.2

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
