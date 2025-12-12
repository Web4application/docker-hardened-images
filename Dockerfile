FROM <pecl>/dhi-php:<tag>-dev AS builder
WORKDIR /tmp
RUN git clone https://github.com/phpredis/phpredis.git \
    && cd phpredis \
    && phpize \
    && ./configure \
    && make \
    && make install

FROM <pecl>/dhi-php:<tag>-fpm
COPY --from=builder /usr/local/lib/php/extensions /usr/local/lib/php/extensions
RUN echo "extension=redis.so" > $PHP_INI_DIR/conf.d/redis.ini
