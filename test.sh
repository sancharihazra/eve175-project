#!/bin/bash

#run code and save oytput file
./search_files.sh project .txt "TODO" > test_output.txt

#expected  output:

cat << EOF > expected.txt
=== Match Counts ===
notes.txt: 2
log.txt: 1
=== Matching Lines ===
--- notes.txt ---
TODO: fix parser
TODO: add tests
--- log.txt ---
TODO: check output
=== Summary ===
Files scanned: 3
Files with matches: 2
Total matching lines: 3
EOF

if diff test_output.txt  expected.txt > /dev/null
then
	echo "Test 1: PASS"
else
	echo "Test 1: FAIL"
fi

#if 

