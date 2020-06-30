FROM centos
MAINTAINER nishadali01016@gmail.com
RUN yum install httpd -y
ENTRYPOINT ["/usr/sbin/httpd", "-D","FOREGROUND"]


