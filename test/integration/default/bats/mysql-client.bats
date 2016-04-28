#!/usr/bin/env bats

setup() {
    apt-get install -y mysql-client
}

@test "Mysql client connect to sphinx" {
    mysql -h localhost -P 9306 --protocol=tcp -e'show tables;'
}

@test "Search existen id 1234" {
  hits=`mysql -h localhost -P 9306 --protocol=tcp -e'select * from test_index where id=1234' | grep -c 1234`
  [ "$hits" -gt 0 ]
}
