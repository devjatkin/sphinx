
#!/usr/bin/env bats

setup() {
  cp $BATS_TEST_DIRNAME/fixtures/test.xml /tmp/
}

@test "Rotate all indexes" {
  indexer --rotate --all
}

@test "Search non-existen keyword notanother" {
  hits=`search notanother | grep hits | awk '{print $5}'`
  [ "$hits" -eq 0 ]
}

@test "Search existen keyword another" {
  hits=`search another | grep hits | awk '{print $5}'`
  [ "$hits" -gt 0 ]
}
