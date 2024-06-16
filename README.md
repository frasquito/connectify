# Connectify: Useful Environment Variable Setter

This Bash script sets the following environment variables: `$address`, `$target_address`, `$setup_address`, `$rpc`, `$target`.

It retrieves connection information from a specified IP and port, parses the JSON response, and sets environment variables accordingly. This script is particularly useful for configuring environment variables related to Hack The Box (HTB), Hacken Proof, Blockchain, Solidity, and Foundry.

## Prerequisites

Before running this script, ensure that `jq` (a lightweight and flexible command-line JSON processor) is installed on your system. You can install it using your package manager (e.g., `apt`, `yum`, `brew`, etc.).

```bash
# Example installation using apt (for Debian/Ubuntu)
sudo apt update
sudo apt install jq
```

```bash
# Example installation using yum (for CentOS/RHEL)
sudo yum install jq
```

## Usage
To run the script, follow these steps:

Download the Script: Download the connectify.sh script to your desired directory.

Make the Script Executable: If necessary, make the script executable using chmod command:

```bash
chmod +x connectify.sh
```

Run the Script: Execute the script using one of the following methods:

## Execution

```bash
source ./connectify.sh <IP>:<PORT>
```

or

```bash
. ./connectify.sh <IP>:<PORT>
```

## Notes

Ensure that the provided IP and port are accessible and correct.
This script assumes a Linux/Unix environment with bash shell.
If sourcing the script, remember that environment variables will affect the current shell session.
