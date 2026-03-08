This project is a multi-file search and summary. 

It contains a Bash script called search_files.sh that searches for a pattern (for example, "TODO") across multiple files such as notes.txt, readme.txt, and log.txt in a directory (for example, project/). The script scans all files with a specific extension (such as .txt, .vcf, or .fa) in the given directory and counts how many lines match the search pattern.

The output includes the number of matches per file, the matching lines grouped by file, and a summary showing the total number of files scanned, the number of files with matches, and the total number of matching lines.

A test script is included to check that search_files.sh works correctly
The tests verify:
1. Verifies correct matches for the search pattern in .txt files
2. Verifying the script reports no matches when the pattern is not found
3. Verifying the script detects an invalid directory
4. Verifying the script runs correctly when no files match the file extension
