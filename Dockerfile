FROM alpine:3.15.6
Maintainer drajathasan
RUN apk add shadow php7 php7-pdo php7-pdo_mysql php7-gd php7-mbstring php7-apache2 apache2 php7-session php7-json php7-mysqli php7-gettext php7-iconv php7-curl php7-openssl php7-tokenizer php7-xmlrpc php7-soap php7-ctype php7-zip php7-simplexml php7-dom php7-xml php7-intl php7-redis php7-xmlreader php7-fileinfo php7-sodium php7-exif php7-opcache
RUN usermod -u 1000 apache
RUN chown apache:apache -R /var/www/localhost
WORKDIR /var/www/localhost/htdocs
COPY ./httpd.conf /etc/apache2/
EXPOSE 80
CMD  [ "/usr/sbin/httpd", "-D", "FOREGROUND"]
