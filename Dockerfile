FROM centos:6.8
MAINTAINER Romeo Salayo Jr <rsalayo@openit.com>

RUN yum install -y ksh
RUN /openit/releases/Supported/REL_6-5-0-22/unix/server/dist/setup -b -c setup/answer.key

VOLUME /var/opt/openit/etc
VOLUME /data

EXPOSE 80 7478

CMD ["/sbin/my_init"]