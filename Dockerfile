FROM centos
MAINTAINER nishadali01016@gmail.com
RUN yum install httpd -y && touch /var/www/html/index.html && echo " Hi, MY firsy codedeploy application" > /var/www/html/index.html
RUN chown apache:apache /var/www/html/index.html 
ENTRYPOINT ["/usr/sbin/httpd", "-D","FOREGROUND"]


