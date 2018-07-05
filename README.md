# Ontic PHP ![Status](https://img.shields.io/badge/project-maintained-brightgreen.svg)

| Branch             | Build               | Galaxy              | Release              |
| :----------------- | :------------------ | :------------------ | :------------------- |
| **master**         | [![Build](https://img.shields.io/travis/ontic/ansible-role-php/master.svg)](https://travis-ci.org/ontic/ansible-role-php) | [![Galaxy](https://img.shields.io/badge/galaxy-ontic.php-blue.svg)](https://galaxy.ansible.com/ontic/php) | [![Release](https://img.shields.io/github/release/ontic/ansible-role-php.svg)](https://github.com/ontic/ansible-role-php/releases) |

## Introduction

This role installs PHP on RedHat/CentOS and Debian/Ubuntu Linux servers.

## Requirements

| Name                                                                                          | Version       |
| :-------------------------------------------------------------------------------------------- | :------------ |
None                                                                                            | N/A           |


## Installation

We strongly suggest installing this role using [Ansible Galaxy](https://galaxy.ansible.com) so that any dependencies
will get resolved and downloaded automatically. However, we've listed a few other alternatives.

### 1.1 Downloading

Download the project files as a `.zip` archive, extracting them into your `./roles/` directory.

### 1.2 Cloning

Clone the project it into your `./roles/` directory.

### 1.3 Ansible Galaxy

The easiest way to install this module is via the command line:

```
$ ansible-galaxy install ontic.php
```

If you have multiple roles to install, the ansible-galaxy CLI can be fed a `requirements.yml` file.

```yml
- src: ontic.php
```

```
$ ansible-galaxy install -r requirements.yml
```

Alternatively you could download the source by setting the repository in your `requirements.yml` file:

```yml
- src: git+https://github.com/ontic/ansible-role-php.git
  version: master
  name: ontic.php
```

### 2.1 Enabling

Enable the role in your playbook file.

```yml
- name: Example web server
  hosts: web_servers
  roles:
    - { role: ontic.php }
```

## Documentation

Full documentation is available in the [docs](/docs) directory.

## Contributors

Below lists all individuals having contributed to the repository. If you would like to get involved, we encourage
you to do so by making a [pull](../../pulls) request or submitting an [issue](../../issues).

* [Adam Dyson](https://github.com/adamdyson)
* [Ramūnas Dronga](https://github.com/ramunasd)

## License

Licensed under the BSD License. See the [LICENSE](/LICENSE) file for details.