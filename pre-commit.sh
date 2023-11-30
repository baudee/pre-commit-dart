#!/bin/sh
set -e

LINE_LENGTH=80
WORKING_DIR="."
FORMAT_ACTION=true
ANALYZE_ACTION=true
TEST_ACTION=true
IS_FLUTTER=false

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
    --actions=*)
    FORMAT_ACTION=false
    ANALYZE_ACTION=false
    TEST_ACTION=false
    IFS=',' read -ra ACTIONS <<< "${i#*=}"
    for action in "${ACTIONS[@]}"; do
        if [ "$action" = "format" ]; then FORMAT_ACTION=true; fi
        if [ "$action" = "analyze" ]; then ANALYZE_ACTION=true; fi
        if [ "$action" = "test" ]; then TEST_ACTION=true; fi
    done
    shift
    ;;
    --is-flutter=*)
    IS_FLUTTER="${i#*=}"
    shift
    ;;
    *)
    ;;
esac
done

cd "$WORKING_DIR"

if [ "$FORMAT_ACTION" = true ]; then
  dart format --line-length="$LINE_LENGTH" --set-exit-if-changed .
fi
if [ "$ANALYZE_ACTION" = true ]; then
  if [ "$IS_FLUTTER" = true ]; then
    flutter analyze
  else
    dart analyze
  fi
fi
if [ "$TEST_ACTION" = true ]; then
  if [ "$IS_FLUTTER" = true ]; then
    flutter test
  else
    dart test
  fi
fi
