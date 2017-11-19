#!/bin/bash

# Debug
docker exec --tty ${container_id} env TERM=xterm /etc/default/php53-fpm
docker exec --tty ${container_id} env TERM=xterm /usr/sbin/php53-fpm --fpm-config /etc/php53/fpm/php-fpm.conf -t
docker exec --tty ${container_id} env TERM=xterm systemctl status php53-fpm.service
docker exec --tty ${container_id} env TERM=xterm journalctl -xe

# Verify the installed PHP location.
docker exec --tty ${container_id} env TERM=xterm which php

# Verify the installed PHP version.
docker exec --tty ${container_id} env TERM=xterm php --version

# Verify the installed PHP modules.
docker exec --tty ${container_id} env TERM=xterm php -m