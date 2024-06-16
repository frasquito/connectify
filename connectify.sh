#!/bin/bash

# Function to check if jq is installed
check_jq() {
    if ! command -v jq &> /dev/null; then
        echo "jq is not installed. Please install jq to run this script."
        exit 1
    fi
}

# Main script execution

# Check if jq is installed
check_jq

if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    # Parse command-line arguments
    if [ $# -eq 1 ]; then
        ip_port="$1"
        url="http://${ip_port}/connection_info"
        response=$(curl -s "$url")

        # Check if HTTP request was successful
        if [ $? -eq 0 ]; then
            # Parse JSON response using jq
            private_key=$(echo "$response" | jq -r '.PrivateKey')
            address=$(echo "$response" | jq -r '.Address')
            target_address=$(echo "$response" | jq -r '.TargetAddress')
            setup_address=$(echo "$response" | jq -r '.setupAddress')

            # Set environment variables
            export private_key="$private_key"
            export address="$address"
            export target_address="$target_address"
            export setup_address="$setup_address"
            export rpc="http://${ip_port}/rpc"
            export target="$target_address"

            echo "Environment variables have been set:\n\$private_key, \$address, \$target_address, \$setup_address, \$rpc, \$target (short for target_address.)"
        else
            echo "Failed to retrieve connection info from $url."
        fi
    else
        echo "Usage: source/. $0 <IP>:<PORT>"
    fi
else
    echo "Script was not sourced source/. $0 <IP>:<PORT>"
fi
