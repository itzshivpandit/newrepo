FROM ubuntu
RUN apt-get update -y && \
    apt-get install apache2 -y && \
    apt-get install git -y
ADD . /var/www/html
VOLUME ["/developer"]
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
