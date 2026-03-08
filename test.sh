#!/bin/bash

#run code and save oytput file
./search_files.sh project .txt "TODO" > test_output.txt

#expected  output:

cat << EOF > expected.txt
=== Match Counts ===
log.txt: 1
notes.txt: 2
=== Matching Lines ===
---log.txt ---
TODO: check output
---notes.txt ---
TODO: fix parser
TODO: add tests
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

#if the pattern doesn't exist (Should print fail)
./search_files.sh project .txt "XYZ" > test_output2.txt

if grep -q "Files with matches: 0" test_output2.txt
then
    echo "Test 2: PASS"
else
    echo "Test 2: FAIL"
fi

#is directory doesnt exist
./search_files.sh invalid_directory .txt "TODO" > test_output3.txt 2>&1

if grep -q "Error" test_output3.txt
then
    echo "Test 3: PASS"
else
    echo "Test 3: FAIL"
fi

