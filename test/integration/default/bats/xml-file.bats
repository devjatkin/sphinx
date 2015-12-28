
#!/usr/bin/env bats

WORD0='another'
WORD1='notanother'

setup() {
  cp $BATS_TEST_DIRNAME/fixtures/test.xml /tmp/
}

@test "Rotate all indexes" {
  indexer --rotate --all
}

@test "Search keyword '$WORD0'" {
  hits=`search $WORD0 | grep hits | awk '{print $5}'`
  [ "$hits" -gt 0 ]
}

@test "Search keyword '$WORD1'" {
  hits=`search $WORD1 | grep hits | awk '{print $5}'`
  [ "$hits" -eq 0 ]
}
