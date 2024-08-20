#!/bin/bash

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <source_file>"
    exit 1
fi

source_file="$1"
executable="program"

# Verify if the source file exists
if [ ! -f "$source_file" ]; then
    echo "Error: File '$source_file' not found."
    exit 1
fi

# Compile the source file with debug symbols
gcc -o "$executable" -g "$source_file"

# Verify if the compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful. Running perf stat..."

    total_user_time=0
    num_tries=10

    # Run the program 10 times and accumulate user times
    for ((i=0; i<num_tries; i++)); do
        # Run the program with perf stat and capture the output
        output=$(perf stat -r 1 -o perf_output "./$executable" 2>&1)
        
        # Extract the "seconds user" value from the perf stat output
        user_time=$(grep "seconds user" perf_output | awk '{print $1}')
        
        # Add the current user time to the total
        total_user_time=$(bc <<< "$total_user_time + $user_time")
    done

    # Calculate the average user time
    average_user_time=$(bc <<< "scale=6; $total_user_time / $num_tries")
    
    # Display the average user time
    echo "Average user time over $num_tries runs: $average_user_time seconds"
    
    # Clean up temporary file
    rm perf_output
else
    echo "Compilation failed."
fi
