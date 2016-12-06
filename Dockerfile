FROM centos:6.8
MAINTAINER Romeo Salayo Jr <rsalayo@openit.com>

RUN yum install -y ksh wget
RUN cd /tmp && wget https://dropbox.openit.com/25ba14f858ce242073ca1479e2ef7bef/openit_6_5_0_22_server_linux_x86_64.tar

# Extract and Install OpeniT CoreServer
ADD setup/answer.key
RUN tar -xvpf openit_6_5_0_22_server_linux_x86_64.tar
RUN /openit/releases/Supported/REL_6-5-0-22/unix/server/dist/setup -b -c setup/answer.key

# Ports and Volumes
VOLUME /var/opt/openit/etc /data
EXPOSE 80 7478