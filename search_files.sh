# checks is user has 3 arguments
if [ $# -ne 3 ]; then
    echo "Error: Missing arguments"
    echo "Usage: ./search_files.sh DIRECTORY EXTENSION PATTERN"
    exit 1
fi

#command line arguments to variables
directory=$1
extension=$2
pattern=$3

#inital count 
files_scanned=0
files_with_matches=0
total_matches=0


#checks if the directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi


echo "=== Match Counts ==="
for file in "$directory"/*"$extenstion"
	if [-f "$file"]; then
		files_scanned =$((files_scanned+1))
		count=$(grep -c "$pattern" "$file")
		if [ $count -gt 0 ]; then
			echo "$( "$file"): $count"
			files_with_matches=$((files_with_matches+1))
           		total_matches=$((total_matches+count))
		fi
	fi
done

#print outputs:
echo "=== Matching Lines ==="
for file in "$directory"/*"$extension"
do
	if [-f "$file" ]; then
		if grep -q "$pattern" "$file"; then
			echo "---$($file) ---"
			grep "$pattern" "$file"
		fi
	fi
done

#summary
echo "=== Summary ==="
echo "Files scanned: $files_scanned"
echo "Files with matches: $files_with_matches"
echo "Total matching lines: $total_matches"
