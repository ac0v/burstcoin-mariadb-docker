# Burstcoin with MariaDB on Docker

Run a small docker based Burstcoin Wallet with mariadb as backend. The wallet we use can be found at https://github.com/ac0v/burstcoin

Attention: The MariaDB container is accessed by using the database root user - cause this user has the SUPER privilege, which is necessary for promoting the database..

## Requirements

* [Docker](https://docs.docker.com/compose/install/)
* [Docker Compose](https://www.docker.com/community-edition)

## Configure

Please take a look at default.env
It might be a good idea to edit your database password.

## Run it!

```sh

docker-compose up
```

