#!/bin/bash

sed -i "s;%SERVERNAME%;$SERVERNAME;g" /etc/apache2/sites-available/dsp.conf

/usr/sbin/apachectl -e info -DFOREGROUND
