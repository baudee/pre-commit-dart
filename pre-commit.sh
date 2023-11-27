#!/bin/sh
set -e

LINE_LENGTH=80
WORKING_DIR="."

for i in "$@"
do
case $i in
    --line-length=*)
    LINE_LENGTH="${i#*=}"
    shift
    ;;
    --dir=*)
    WORKING_DIR="${i#*=}"
    shift
    ;;
    *)
    ;;
esac
done

cd "$WORKING_DIR"
dart format --line-length="$LINE_LENGTH" .
dart analyze
dart test
