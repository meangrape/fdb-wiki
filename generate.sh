#!/bin/bash

# is passed a markdown filenamd
function pandoc() {
  myfile="$1"
  pandoc --pdf-engine=xelatex -o pdfs/"$myfile.pdf" "$myfile"
}

# ls -p is "Write a slash (‘/’) after each filename if that file is a directory"
files=$(ls -p | rg -g '! generate.sh' -)

for file in $files; do
  # move new files to markdown
  if [[ ! "$file" =~ .*\.md$ ]]; then
    mv "$file" "$file.md"
  fi
done

for file in $files; do
  # if a markdown file
  if [[ "$file" =~ .*\.md$ ]]; then
    # doesn't have a font header
    if ! rg Abitare "$file"; then
      tmpfile=$(/tmp/"$file.XXX")
      cat ./fonts/font-header.yml "$file" > "$tmpfile"
      rm "$tmpfile"
    fi
    pandoc "$file"
  fi

  # regenerate md files modified by last commit if git merge
  gitfiles=$(git log -m --name-only HEAD)
  for modified in $gitfiles; do
    pandoc "$modified"
  done
done
