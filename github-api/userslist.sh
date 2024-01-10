
#!/bin/bash

# Ensure required arguments are provided
if [ "$#" -ne 4 ]; then
	  echo "Usage: $0 <organization-name> <repository-name> <github-username> <personal-access-token>"
	    exit 1
fi

ORG_NAME="$1"
REPO_NAME="$2"
USERNAME="$3"
TOKEN="$4"

# Make an API request to list contributors to the repository
response=$(curl -s -H "Authorization: token $TOKEN" \
	  "https://api.github.com/repos/$ORG_NAME/$REPO_NAME/contributors")

# Check if the request was successful
if [ $? -ne 0 ]; then
	  echo "Error: Unable to fetch repository contributors."
	    exit 1
fi

# Parse the response to extract contributors' usernames
usernames=$(echo "$response" | grep -oP '(?<="login": ")[^"]*' | sort -u)

# Display the list of contributors
echo "Users in $ORG_NAME/$REPO_NAME:"
echo "$usernames"

