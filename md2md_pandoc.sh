#!/bin/bash

# do not mv when pandoc fails
set -e

# file_ may exists => maybe use temp file TMPFILE=$(mktmp)

for mdfile in $(find . -maxdepth 1 -type f -iname "*.md"); do
    echo "processing ... " ${mdfile}
    pandoc -s ${mdfile} -t markdown -o ${mdfile}_
    # pandoc -s ${mdfile} -f markdown-raw_html -t markdown_strict -o ${mdfile}_
    # pandoc -s ${mdfile} -f markdown+raw_html -t markdown_strict -o ${mdfile}_
    # pandoc -s ${mdfile} -f markdown+raw_html -t markdown -o ${mdfile}_
    # pandoc -s ${mdfile} -f markdown-raw_html -t markdown -o ${mdfile}_
    mv ${mdfile}_  ${mdfile}
done

