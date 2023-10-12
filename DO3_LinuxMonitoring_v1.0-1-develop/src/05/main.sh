#!/bin/bash

. ./print10files.sh

# check if a parameter was provided
if [ -z "$1" ]; then
  echo "No directory path provided."
  exit 1
fi

# check if the provided path ends with '/'
if [[ "${1}" != */ ]]; then
  echo "Directory path must end with '/'."
  exit 1
fi

# get directory information
START_TIME=$(date +%s.%N)
DIR=$1
TOTAL_FOLDERS=$(find "${DIR}" -type d | wc -l)
TOTAL_FILES=$(find "${DIR}" -type f | wc -l)
CONFIG_FILES=$(find "${DIR}" -type f -name '*.conf' | wc -l)
TEXT_FILES=$(find "${DIR}" -type f -name '*.txt' | wc -l)
EXEC_FILES=$(find "${DIR}" -type f -perm /u=x,g=x,o=x | wc -l)
LOG_FILES=$(find "${DIR}" -type f -name '*.log' | wc -l)
ARCHIVE_FILES=$(find "${DIR}" -type f \( -name '*.zip' -o -name '*.tar' -o -name '*.gz' \) | wc -l)
SYMBOLIC_LINKS=$(find "${DIR}" -type l | wc -l)

# get top 5 largest folders
TOP_FOLDERS=$(du -sh "${DIR}"* 2>/dev/null | sort -hr | head -n 5 | awk '{printf "%s, %s\n", $2, $1}' | nl -s ' - ' -w 1)

# get top 10 largest files
TOP_FILES=$(find "${DIR}" -type f -printf '%s %p\n' | sort -rh | head -n 10)

# get top 10 largest executable files with MD5 hash
TOP_EXEC_FILES=$(find 2>/dev/null "${DIR}" -type f -exec du -hs {} \; | sort -rh | head -n 10 | awk '{printf("%s, %s, ", $2, $1); system("echo -n "$2 "| md5sum 2>/dev/null | cut -d\" \"  -f1")}' | nl -s ' - ' -w 1)

# output directory information
echo "Total number of folders (including all nested ones) = ${TOTAL_FOLDERS}"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "${TOP_FOLDERS}"
echo "Total number of files = ${TOTAL_FILES}"
echo "Number of:"
echo "Configuration files (with the .conf extension) = ${CONFIG_FILES}"
echo "Text files = ${TEXT_FILES}"
echo "Executable files = ${EXEC_FILES}"
echo "Log files (with the extension .log) = ${LOG_FILES}"
echo "Archive files = ${ARCHIVE_FILES}"
echo "Symbolic links = ${SYMBOLIC_LINKS}"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "${TOP_FILES}" | print_top_10_files
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
echo "${TOP_EXEC_FILES}"
echo "Script execution time (in seconds) = $(echo "$(date +%s)")"