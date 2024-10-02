#!/bin/bash

# Fetch the quote using curl
quote=$(curl -s https://zenquotes.io/api/today)

# Extract the quote and author using jq (if installed)
content=$(echo $quote | jq -r '.[0].q')
if [ -z "${content}"]; then
    echo "Hello there"
fi
# Display the quote
echo "$content"
