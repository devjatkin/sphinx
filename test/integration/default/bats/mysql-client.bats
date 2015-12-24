#!/usr/bin/env bats

setup() {
    apt-get install -y mysql-client
}

@test "Mysql client connect to sphinx" {
    mysql -h localhost -P 9306 --protocol=tcp -e'show tables;'
}
