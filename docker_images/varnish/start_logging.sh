#!/bin/bash

#Start Varnish service
/usr/sbin/varnishd -s malloc,256M -a :6081 -f /etc/varnish/default.vcl 
#Start log service
/usr/bin/varnishncsa -F 'X-Forward-For: \"%{X-Forwarded-For}i\" - %{Host}i %h %l %u %t \"%r\" %s %b \"%{Referer}i\" \"%{User-agent}i\" - \"%{Varnish:hitmiss}x\"' -w /var/log/varnish/varnish.log -a
