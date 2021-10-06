#!/bin/dash

set -eu 

# --------------------------------------------------------------------------------------------------------------------------------------------------

if [ $# -eq 0 ]; then
    echo "The first argument should be a valid PDF"
    echo "PDFs in current dir:"
    ls -1 *.pdf
    exit 1
fi

if [ ! -f $1 ]; then
    echo "$1 does not exist"
    exit 1
fi
# --------------------------------------------------------------------------------------------------------------------------------------------------

# Save formatted text output of input PDF, using pdftotext.
#   Using "-" specifies output as std out. 
IDENTIFIER_SEARCH_AREA="$(pdftotext -layout -l 25 $1 -)"

# For the speedtest, just print to /dev/null.
echo "${IDENTIFIER_SEARCH_AREA}" >> /dev/null

# --------------------------------------------------------------------------------------------------------------------------------------------------

exit 0