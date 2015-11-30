# Documentation

## Example

```
php_ppa: ppa:ondrej/php5-5.6
php_web_server_service_name:
php_fpm_pkg_state: present
php_fpm_service_state: started
php_fpm_service_enabled: yes
php_fpm_conf_template: yourdomain.php-fpm.conf.j2
php_fpm_pool_templates:
  - name: www
    state: absent
  - name: yourdomain
    template: yourdomain.php-fpm-pool.conf.j2
php_packages:
  - name: php5
  - name: php5-cli
  - name: php5-common
  - name: php5-curl
  - name: php5-dev
  - name: php5-fpm
  - name: php5-gd
  - name: php5-imagick
  - name: php5-imap
  - name: php5-intl
  - name: php5-ldap
  - name: php5-mcrypt
  - name: php5-mongo
  - name: php5-mysql
  - name: php-pear
  - name: php5-readline
  - name: php5-redis
  - name: php5-tidy
  - name: php5-xdebug
    state: absent
  - name: php5-xmlrpc
  - name: php5-xsl
php_pecl_extensions:
  - name: igbinary
  - name: amfext
    state: absent
php_ini:
  - { section: PHP, option: max_execution_time, value: 60 }
  - { section: Session, option: session.serialize_handler, value: igbinary }
  - { section: igbinary, option: igbinary.compact_strings, value: 1 }
php_cli_ini:
  - { section: PHP, option: max_execution_time, value: 0 }
  - { section: Session, option: session.serialize_handler, value: igbinary }
  - { section: igbinary, option: igbinary.compact_strings, value: 1 }
```

## Role Variables

Available variables are listed below, along with default values (see [defaults/main.yml](/defaults/main.yml)):

```
php_repository:
```

The repository to add to APT. Which would allow more recent versions of PHP to be installed.

```
php_web_server_service_name:
```

The name of the daemon under which your web server runs. Typically this can be omitted since most web servers work
independently from PHP and generally do not need to be restarted after PHP configuration settings are changed. If
however you're running an older software stack where PHP is used as an Apache module, then you could set this
variable to `httpd` for RedHat/CentOS or `apache2` for Debian/Ubuntu. The service would be restarted every time
your INI files are changed or a new package/extension is installed.

```
php_fpm_pkg_state: present
```

The desired PHP-FPM package state, valid values are `present`, or `absent`.

```
php_fpm_service_state: started
```

The desired PHP-FPM service state, valid values are `started`, `stopped`, `restarted` or `reloaded`.

```
php_fpm_service_enabled: yes
```

Whether the PHP-FPM service should start on boot, valid values are `yes`, or `no`.

```
php_fpm_conf_template: php-fpm.conf.j2
```

The template file name that replaces the PHP-FPM configuration file.

```
php_fpm_pool_templates:
```

The PHP-FPM pools you would like to manage. Each pool expects two parameters, `name` which is the name of
the pool and `template`, which is the name of the source template file. An optional parameter `state` can be
specified, valid values are `present` (*Default*) or `absent`. When defined and the value is `absent` a destination
file matching the `name` parameter will be removed.

```
php_packages:
```

A list of the PHP packages to install. Each package supports all parameters from the
[apt](http://docs.ansible.com/ansible/apt_module.html) or [yum](http://docs.ansible.com/ansible/yum_module.html) modules.
If the value remains omitted, the following packages will be installed by default.

| Debian/Ubuntu          | RedHat/CentOS           |
| :--------------------- | :---------------------- |
| php5                   |  php                    |
| php5-cli               |  php-cli                |
| php5-common            |  php-common             |
| php5-curl              |  php-curl               |
| php5-dev               |  php-devel              |
| php5-fpm               |  php-fpm                |
| php5-gd                |  php-gd                 |
| php5-imagick           |  ImageMagick            |
| php5-imap              |  php-imap               |
| php5-intl              |  php-intl               |
| php5-ldap              |  php-ldap               |
| php5-mcrypt            |  php-mcrypt             |
| php5-mysql             |  php-mysql              |
| php-pear               |  php-pear               |
| php5-tidy              |  php-tidy               |
| php5-xdebug            |  php-xdebug             |
| php5-xmlrpc            |  php-xmlrpc             |
| php5-xsl               |  php-xsl                |

```
php_pecl_extensions:
```

A list of the PECL extensions to install. Each extension expects one parameter, `name` which is the name of
the extension. An optional parameter `state` can be specified, valid values are `present` (*Default*) or `absent`.
When defined and the value is `absent` a extension matching the `name` parameter will be removed.

```
php_ini:
```

An array of option hashes used to customise PHP (or PHP-FPM) configuration settings. Each option expects three
parameters, `section` which is the section name in INI file, `option` if set (required for changing a value), is
the name of the option and can be omitted if adding/removing a whole section. Then finally `value`, a string
value to be associated with an option, this can also be omitted when removing an option.

```
php_cli_ini:
```

An array of option hashes used to customise PHP-CLI configuration settings. Each option expects three
parameters, `section` which is the section name in INI file, `option` if set (required for changing a value), is
the name of the option and can be omitted if adding/removing a whole section. Then finally `value`, a string
value to be associated with an option, this can also be omitted when removing an option.

> By default on Debian/Ubuntu you have different configuration files for PHP in Apache, FPM, CLI etc. But on
RedHat/CentOS, you only have one configuration file for them all. This is not ideal since most developers will need
to have different configuration settings (`max_execution_time`, `memory_limit` etc) for scripts running in CLI mode.
If you're a RedHat/CentOS fan then don't stress, this Ansible role solves this problem!