#!/bin/bash
# Copyright (c) Ontic. (http://www.ontic.com.au). All rights reserved.
# See the COPYING file bundled with this package for license details.

# Verify the installed location.
docker exec --tty ${container_id} env TERM=xterm which php
# Verify the installed version.
docker exec --tty ${container_id} env TERM=xterm php --version
# Verify the installed modules.
docker exec --tty ${container_id} env TERM=xterm php -m