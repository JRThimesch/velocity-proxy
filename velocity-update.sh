#!/bin/bash

# Set the API URL
api_url="https://api.papermc.io/v2/projects/velocity/versions/3.3.0-SNAPSHOT/builds"

# Fetch the JSON data from the API
response=$(curl -s "$api_url")

# Parse the JSON to find the latest build number
latest_build=$(echo "$response" | jq -r '.builds[-1].build')

# Get the download link for the latest build
download_name=$(echo "$response" | jq -r '.builds[-1].downloads.application.name')
download_link="$api_url/$latest_build/downloads/$download_name"

# Print the results
echo "Latest Build: $latest_build"
echo "Download Link: $download_link"

# Download the latest build
wget "$download_link" -O /velocity/velocity.jar