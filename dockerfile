FROM yeplaa/armhf-alpine
MAINTAINER Loic Fouray <loic@yeplaa.net>

RUN apk add --no-cache nginx && adduser -D -u 1000 -g 'www' www

RUN mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www

RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/


VOLUME /www /var/lib/nginx

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]