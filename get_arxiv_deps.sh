
cat $1 |  grep "^    [^/]*$" | grep -o "[^\\]*" | grep -v ".*\.bib" 