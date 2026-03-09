# Multi-File Search and Summary

## Description
This project is a multi-file search and summary tool.

It contains a Bash script called search_files.sh that searches for a pattern ("TODO") across multiple files such as notes.txt, readme.txt, and log.txt in a directory called project/. The script scans all files with a specific extension (such as .txt, .vcf, or .fa) in the given directory and counts how many lines match the search pattern.

The output includes:
- The number of matches per file
- The matching lines grouped by file
- A summary showing:
  - Total number of files scanned
  - Number of files with matches
  - Total number of matching lines

## Running the Script

To run the script:
./search_files.sh project txt "TODO"

Explanation of argument:
- project: directory containing the files
- txt: file extension to search
- "TODO": pattern to search
 
## Test Script
A test script is included to verify that search_files.sh works correctly.
The tests verify:
- Correct matches for the search pattern in .txt files
- The script reports no matches when the pattern is not found
- The script detects an invalid directory
- The script runs correctly when no files match the specified file extension

## Running the test file
bash test.sh

## AI Assistance
AI tools (Claude) were used to help with parts of this project:
- Formatting and organizing the README file
- Debugging syntax errors in the Bash script

 All codes was reviewed, tested, and understood before submission.
