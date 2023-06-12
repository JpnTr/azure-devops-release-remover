#!/bin/bash

# Set variables
org="organization-name"
project="project-name"
releaseId="$1"

# Check if the release ID is provided
if [ -z "$releaseId" ]; then
  echo "Release ID is not provided. Usage: ./remove-release.sh <release-id>"
  exit 1
fi

# Get the access token
accessToken=$(az account get-access-token --resource https://management.core.windows.net/ --query accessToken -o tsv)

# Remove the release
curl -X DELETE \
  "https://vsrm.dev.azure.com/$org/$project/_apis/release/releases/$releaseId?api-version=6.1-preview" \
  -H "Authorization: Bearer $accessToken"
