FROM quay.io/turner/fargate-cicd
ENV PHP=7.3
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get upgrade -y \
   && apt-get install -y software-properties-common \
   && LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update -y \
    && apt-get install -y php${PHP} php${PHP}-cli php${PHP}-fpm php${PHP}-curl php${PHP}-xml php${PHP}-mbstring php${PHP}-bcmath php${PHP}-zip \
    php${PHP}-mysql php${PHP}-bz2 php${PHP}-gd patch

RUN apt-get upgrade -y nodejs \
    && apt-get install -y npm sass \
    && npm cache clean -f \
    && npm install -g n \
    && n stable \
    && PATH="$PATH" npm install -g gulp gulp-cli gulp-livereload gulp-if gulp-eslint gulp-sass gulp-autoprefixer gulp-sourcemaps gulp-sass-lint imagemin-pngquant --unsafe-perm=true --allow-root \
    && npm rebuild node-sass

    # php${PHP}-mcrypt not available for 7.2

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
