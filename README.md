# Requirements

- Database dump file of 360 development environment e.g. 360_dev.dump
- Database dump file of vrtour development environment e.g. vrtour_dev.dump

| Tools    | Version           | URL                                          |
|----------|-------------------|----------------------------------------------|
| PHP      | 5.6.\*   or later | http://www.php.net/                          |
| Docker   | 17.09.\* or later | https://docs.docker.com/engine/installation/ |
| mysql    | 5.7.\*   or later | https://www.mysql.com/                       |

# Docker dev environment

To run a docker dev entionment do the following:

## ex2-dev repository

```
$ cd path/to/ex2-dev
$ cp .env.example .env
$ cp env-example/iam/env             path/to/ex2-iam/.env
$ cp env-example/360/database.php    path/to/360StreamPF_KMC_PHP/app/Config/database.php
$ cp env-example/360/bootstrap.php   path/to/360StreamPF_KMC_PHP/app/Config/bootstrap.php
$ cp env-example/VRTour/database.php path/to/VRTourR/app/Config/database.php
$ cp env-example/VRTour/env.php      path/to/VRTourR/app/Config/env.php
$ vi .env                                                 # Please tweak the setting
$ vi path/to/ex2-iam/.env                                 # Please tweak the setting
$ vi path/to/360streampf_kmc_php/app/Config/database.php  # Please tweak the setting
$ vi path/to/360streampf_kmc_php/app/Config/bootstrap.php # Please tweak the setting
$ vi path/to/vrtourr/app/Config/database.php              # Please tweak the setting
$ vi path/to/vrtourr/app/Config/env.php                   # Please tweak the setting
$ docker-compose up -d
$ scripts/setup.sh
$ mysql -h 127.0.0.1 -u root -p'password' 360_local < 360_dev.dump
$ mysql -h 127.0.0.1 -u root -p'password' vrtour_local < input_data/vrtourr/dump_file/vrtour_local.dump
$ chmod 777 expected/vrtourr
```

## hosts setting

```
echo "127.0.0.1 front1local.rco-ex2.net\n127.0.0.1 vr1local.rco-ex2.net\n127.0.0.1 iam-local.rco-ex2.net\n127.0.0.1 mail-local.rco-ex2.net" | sudo tee -a /etc/hosts
```

- iam will be available at http://iam-local.rco-ex2.net/
- maildev will be available at http://mail-local.rco-ex2.net
