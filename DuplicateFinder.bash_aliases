#!/bin/bash

find_duplicates() {
    local DIR=$1
    declare -A file_hashes
    local duplicates=()

    # Loop through all files in the directory
    for file in "$DIR"/*; do
        if [ -f "$file" ]; then  # Fixed space issue
            # Generate a hash for the file
            hash=$(md5sum "$file" | cut -d ' ' -f 1)

            # Check if this hash already exists
            if [[ -n ${file_hashes[$hash]} ]]; then
                duplicates+=("$file")
            else
                file_hashes[$hash]="$file"
            fi
        fi
    done
    # Return the list of duplicates
    echo "${duplicates[@]}"
}

# Function to remove duplicate files
remove_duplicates() {
    local duplicates=("$@")
    for file in "${duplicates[@]}"; do
        echo "Removing duplicate file: $file"  # Adjusted message for clarity
        rm "$file"
    done
}

# Main script execution
echo "Welcome to the Duplicate File Remover"
echo "Please enter the directory to scan for duplicates:"
read source_directory

if [ -d "$source_directory" ]; then  # Fixed space issue
    duplicates=( $(find_duplicates "$source_directory") )

    if [ ${#duplicates[@]} -eq 0 ]; then  # Fixed space issue
        echo "No duplicate files found."
    else
        echo "Duplicate files found:"
        for dup in "${duplicates[@]}"; do
            echo "$dup"
        done

        echo "Do you want to remove these duplicate files? (y/n)"
        read response
        if [[ "$response" =~ ^[Yy]$ ]]; then
            remove_duplicates "${duplicates[@]}"
            echo "Duplicates removed."
        else
            echo "Duplicates not removed."
        fi
    fi
else
    echo "The specified directory does not exist."
    exit 1
fi
