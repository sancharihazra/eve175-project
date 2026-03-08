#!/bin/bash

#run code and save oytput file
./search_files.sh project .txt "TODO" > test_output.txt

#expected  output

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

#TEST 1: Comparing output to expected output when searching for TODO pattern

echo "Test 1: Verifing correct TODO matches in the .txt files"
if diff test_output.txt  expected.txt > /dev/null
then
	echo "Test 1: PASS (Output matches expected results)"
else
	echo "Test 1: FAIL (Output does not match expected results)"
fi


#TEST 2: Verifying script when pattern is not found
./search_files.sh project .txt "XYZ" > test_output2.txt

if grep -q "Files with matches: 0" test_output2.txt
then
    echo "Test 2: PASS (Script correctly reports no matches when pattern is not found)"
else
    echo "Test 2: FAIL (Script incorrectly reports matches when pattern is not present)"
fi


#TEST 3:  Verifying script directory does not exist

./search_files.sh homework_directory .txt "TODO" > test_output3.txt 2>&1

if grep -q "Error" test_output3.txt
then
    echo "Test 3: PASS (Script correctly detects invalid directory)"
else
    echo "Test 3: FAIL (Script does not report an error for invalid directory)"
fi

