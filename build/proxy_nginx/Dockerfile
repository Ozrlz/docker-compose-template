ARG NGINX_VERSION=1.13.10
FROM nginx:${NGINX_VERSION}

ENV HTTP_PORT 80
ENV HTTPS_PORT 443

COPY ./nginx.conf /etc/nginx/conf.d/odoo.conf

RUN apt update && apt install -y \
    nano && apt-get clean && \
    rm /etc/nginx/conf.d/default.conf

EXPOSE ${HTTP_PORT} ${HTTPS_PORT}