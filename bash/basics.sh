#!/bin/bash


function printCase {
    local allArgs=$@
    echo ""
    echo "==> $0/$allArgs"
}

# 0. Create a basic function
function greet {
    local name age
    echo "Hello, $name! I see that you are $age years old."
}

# Call the function with two arguments
greet John 30

# 1. Write a bash script that takes a dir name as an arg and then prints the size of each file in that directory, followed by the filename.  Output should be sorted by file size, from smallest to largest.

function dirSize {
    local arg1=$1 # parameters
    printCase $FUNCNAME $@ # pass the function name and all the args to printCase

    du -h -d 1 $arg1 | sort
}

dirSize ../

# 2. Write a Bash script that accepts a file name as an argument, and then counts the number of lines, words, and characters in the file. The script should print the results in the following format:
# Number of lines: 5
# Number of words: 20
# Number of characters: 100
function getFileDetails {
    local fileName=$1
    printCase $FUNCNAME $@ # pass the function name and all the args to printCase

    echo "Number of lines: $(wc -l $fileName | awk '{ print $1}')"
    echo "Number of words: $(wc -w $fileName | awk '{ print $1}')"
    echo "Number of characters: $(wc -m $fileName | awk '{ print $1}')"
}

getFileDetails ./basics.sh

# 3. Write a Bash script that accepts a string as an argument, and then prints the string in all uppercase letters.
function toUpper {
    printCase $FUNCNAME $@ # pass the function name and all the args to printCase
    local string=$1
    local upperString=""

    # this for loop is unnecessary, just leaving this here for examples purposes
    for ((i=0; i<${#string}; i++)); do
        char=${string:$i:1}
        echo "Character at index $i: $char"
        upperString+=$char
    done

    # This is the only in that matters here
    echo $upperString | tr '[:lower:]' '[:upper:]'
}
toUpper test

# 4. Write a Bash script that accepts a filename as an argument, and then checks if the file exists. If the file exists, the script should print "File exists" and exit. If the file does not exist, the script should create the file and then print "File created" before exiting.

# 5. Write a Bash script that prints the numbers from 1 to 10, with each number on a new line. Use a loop to accomplish this.

# 6. Write a Bash script that accepts a list of numbers as arguments, and then prints the sum of all the numbers.

# 7. Write a Bash script that accepts a filename as an argument, and then checks if the file is readable, writable, and executable. The script should print "File is readable" if the file is readable, "File is writable" if the file is writable, and "File is executable" if the file is executable.
