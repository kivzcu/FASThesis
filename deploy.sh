#!/bin/bash
# This script creates a deploy archive for the FASThesis project.

# exit on error
set -e

# name of the archive
project_name=$(basename $(pwd))
project_version=$(git tag --points-at HEAD)
deploy_archive_name="${project_name}_${project_version}.zip"

echo "Creating deploy archive ${deploy_archive_name}..."

# deploy only the following files/directories
DEPLOYED_CONTENT=(
    "img"
    "texmf"
    "fasthesis.cls"
    "latexmkrc"
    "manual.bib"
    "manual.tex"
    "manual.pdf"
    "zadani.pdf"
)

# deploy the content to the FASThesis.zip archive
zip -r "${deploy_archive_name}" ${DEPLOYED_CONTENT[@]}

echo "All done!"
