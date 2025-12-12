FROM <your-namespace>/dhi-php:<tag>-dev AS builder
WORKDIR /tmp
RUN pecl download redis \
    && tar xzf redis-*.tgz \
    && cd redis-* \
    && phpize \
    && ./configure \
    && make \
    && make install

FROM <your-namespace>/dhi-php:<tag>-fpm
COPY --from=builder /usr/local/lib/php/extensions /usr/local/lib/php/extensions
RUN echo "extension=redis.so" > $PHP_INI_DIR/conf.d/redis.ini
