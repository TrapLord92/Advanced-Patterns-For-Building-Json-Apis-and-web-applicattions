#!/bin/bash

# Check if Go is installed
if command -v go &> /dev/null
then
    echo "Go is installed. Version:"
    go version
else
    echo "Go is not installed."
fi
