FROM quay.io/turner/fargate-cicd
ENV PHP=7.2

RUN apt-get update -y && apt-get upgrade -y \
   && apt-get install -y python-software-properties \
   && LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update -y \
    && apt-get install -y php${PHP} php${PHP}-cli php${PHP}-fpm php${PHP}-curl php${PHP}-xml php${PHP}-mbstring php${PHP}-bcmath php${PHP}-zip \
    php${PHP}-mysql php${PHP}-bz2 php${PHP}-gd php${PHP}-mcrypt

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
