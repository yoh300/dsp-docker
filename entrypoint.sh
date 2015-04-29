#!/bin/bash
set -e

sed -i "s;%SERVERNAME%;$SERVERNAME;g" /etc/apache2/sites-available/dsp.conf

if [ -n "$DB_PORT_3306_TCP_ADDR" ]; then
  export DB_HOST=$DB_PORT_3306_TCP_ADDR
fi

if [ -n "$DB_PORT_3306_TCP_PORT" ]; then
  export DB_PORT=$DB_PORT_3306_TCP_PORT
fi

/usr/sbin/apachectl -e info -DFOREGROUND
