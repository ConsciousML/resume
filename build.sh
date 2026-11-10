#!/bin/sh
# Build one PDF per location into build/.
set -e
cd "$(dirname "$0")"
mkdir -p build
for loc in Mexico France; do
  name=$(echo "$loc" | tr '[:upper:]' '[:lower:]')
  pdflatex -interaction=nonstopmode -halt-on-error -output-directory build \
    -jobname="resume-$name" "\def\location{$loc (Remote)}\input{resume.tex}"
done
