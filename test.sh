#!/bin/bash

#run code and save output file
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

echo "TEST 1: Verify that the script correctly finds and reports TODO matches in .txt files"
if diff test_output.txt  expected.txt > /dev/null
then
	echo "Test 1: PASS"
        echo "Output matches expected results"
else
	echo "Test 1: FAIL" 
        echo "Output does not match expected results"
fi
echo

#TEST 2: Verifying script when pattern is not found
./search_files.sh project .txt "XYZ" > test_output2.txt

echo "TEST 2: Verify that the script correctly reports zero matches when the search pattern does not appear in any file"
if grep -q "Files with matches: 0" test_output2.txt
then
    echo "Test 2: PASS"
    echo "Script correctly reports no matches when pattern is not found"
else
    echo "Test 2: FAIL"
    echo "Script incorrectly reports matches when pattern is not present"
fi

echo
#TEST 3:  Verifying script when directory does not exist

./search_files.sh homework_directory .txt "TODO" > test_output3.txt 2>&1

echo "TEST 3: Verify that the script detects and reports an error when the specified directory does not exist"
if grep -q "Error" test_output3.txt
then
    echo "Test 3: PASS"
    echo "Script correctly detects invalid directory"
else
    echo "Test 3: FAIL" 
    echo "Script does not report an error for invalid directory"
fi
echo

#TEST 4: Verify script  when file (.fa) extension does not exist
./search_files.sh project .fa "TODO" > test_output4.txt

echo "TEST 4: Verify that the script runs correctly when no files match the specified file extension"
if grep -q "Files scanned: 0" test_output4.txt
then
    echo "Test 4: PASS"
    echo "Script correctly runs and detects no matching file types"
else
    echo "Test 4: FAIL"
    echo "Script incorrectly reports files when no files match the extension"
fi
