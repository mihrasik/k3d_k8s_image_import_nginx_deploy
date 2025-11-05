#!/bin/bash
# Load environment variables from .env file
if [ -f .env ]; then
    set -a
    . .env
    set +a
fi