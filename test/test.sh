#!/bin/sh
# Test basic functionality

set -e

proram=$0
TMPDIR=${TMPDIR:-/tmp}
BASE=tmp.$$
TMPBASE=${TMPDIR%/}/$BASE
CURDIR=.

case "$0" in
  */*)
        CURDIR=$(cd "${0%/*}" && pwd)
        ;;
esac

AtExit ()
{
    rm -f "$TMPBASE"*
}

Run ()
{
    if [ "$1" ]; then           # Empty message, just command to run
        echo "$*"
        shift
    else
        shift
        echo "$*"
    fi

    eval "$@"
}

trap AtExit 0 1 2 3 15

# #######################################################################

# Original sources contain test/ directory. We're being run in CYGWIN-PATCHES/

for file in $CURDIR/../../test/*.xlsx
do
    Run "%% TEST simple:" xlsx2csv "$file"
done

# End of file
