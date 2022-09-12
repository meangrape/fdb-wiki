#!/bin/bash

for file in $(ls -p | rg -g '! generate.sh' -); do
  cat ./fonts/font-header.yml $file > $file.md
  rm $file
  pandoc --pdf-engine=xelatex -o pdfs/$file.pdf $file.md
done
