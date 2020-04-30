#!/bin/bash
memcached -u memcached &
/usr/sbin/httpd -D FOREGROUND
