#!/bin/bash

# Ask the user for the directory where the script will work
echo "Enter the directory where you want to run the script:"
read working_dir

# Check if the directory exists, and if not, exit the script
if [ ! -d "$working_dir" ]; then
    echo "Error: The directory does not exist."
    exit 1
fi

# Change to the working directory
cd "$working_dir"

# Check if the output directory exists, if not, create it
output_dir="png_images"
mkdir -p "$output_dir"

# Loop through all PDF files in the current directory and convert them to PNG
for pdf_file in *.pdf; do
    # Get the filename without the extension
    base_name="${pdf_file%.*}"

    # Convert PDF to PNG images
    pdftoppm "$pdf_file" "$output_dir/$base_name" -png
done
