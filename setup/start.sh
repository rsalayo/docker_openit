#!/bin/bash

echo "ServerName `hostname`" >> /var/opt/openit/etc/httpd/httpd.conf
su - -c "/opt/openit/bin/openit-all start"
ping 127.0.0.1 > /dev/null