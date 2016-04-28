
#!/usr/bin/env bats

@test "Search non-existen keyword notanother" {
  if [ -z `which search` ]; then
    skip "search not found"
  fi
  hits=`search notanother | grep hits | awk '{print $5}'`
  [ "$hits" -eq 0 ]
}

@test "Search existen keyword another" {
  if [ -z `which search` ]; then
    skip "search not found"
  fi
  hits=`search another | grep hits | awk '{print $5}'`
  [ "$hits" -gt 0 ]
}
