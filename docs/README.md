# Documentation

## Example

```
php_ppa: ppa:ondrej/php
php_fpm_conf_template: yourdomain.php-fpm.conf.j2
php_fpm_pool_templates:
  - name: www
    state: absent
  - name: yourdomain
    template: yourdomain.php-fpm-pool.conf.j2
php_packages:
  - name: php7.0-common
  - name: php7.0-cli
  - name: php7.0-dev
  - name: php7.0-fpm
  - name: php7.0-bcmath
  - name: php7.0-bz2
  - name: php7.0-curl
  - name: php7.0-gd
  - name: php7.0-imap
  - name: php7.0-intl
  - name: php7.0-ldap
  - name: php7.0-mbstring
  - name: php7.0-mcrypt
  - name: php7.0-mysql
  - name: php7.0-soap
  - name: php7.0-tidy
  - name: php7.0-xmlrpc
  - name: php7.0-zip
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
| php7.0-common          |  php70w-common          |
| php7.0-cli             |  php70w-cli             |
| php7.0-dev             |  php70w-devel           |
| php7.0-fpm             |  php70w-fpm             |
| php7.0-bcmath          |  php70w-bcmath          |
| php7.0-bz2             |  php70w-gd              |
| php7.0-curl            |  php70w-imap            |
| php7.0-gd              |  php70w-intl            |
| php7.0-imap            |  php70w-ldap            |
| php7.0-intl            |  php70w-mbstring        |
| php7.0-ldap            |  php70w-mcrypt          |
| php7.0-mbstring        |  php70w-opcache         |
| php7.0-mcrypt          |  php70w-pdo             |
| php7.0-mysql           |  php70w-soap            |
| php7.0-soap            |  php70w-tidy            |
| php7.0-tidy            |  php70w-xml             |
| php7.0-xmlrpc          |  php70w-xmlrpc          |
| php7.0-zip             |                         |

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