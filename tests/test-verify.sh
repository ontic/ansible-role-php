#!/bin/bash

# Verify the installed PHP location.
docker exec --tty ${container_id} env TERM=xterm which php

# Verify the installed PHP version.
docker exec --tty ${container_id} env TERM=xterm php --version

# Verify the installed PHP modules.
docker exec --tty ${container_id} env TERM=xterm php -m