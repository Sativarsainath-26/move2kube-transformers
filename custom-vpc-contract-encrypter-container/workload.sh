#!/bin/bash

#Script for creating encrypted env contract

# WORKLOAD="workload.yaml"
CONTRACT_KEY="resources/ibmfinal.crt"
PASSWORD="$(openssl rand 32 | base64 -w0)"
ENCRYPTED_PASSWORD="$(echo -n "$PASSWORD" | base64 -d | openssl rsautl -encrypt -inkey $CONTRACT_KEY  -certin | base64 -w0)"

ENCRYPTED_WORKLOAD="$(echo -n "$PASSWORD" | base64 -d | openssl enc -aes-256-cbc -pbkdf2 -pass stdin -in "$WORKLOAD" | base64 -w0)"

# ENCRYPTED_WORKLOAD="dfdfd"


echo "hyper-protect-basic.${ENCRYPTED_PASSWORD}.${ENCRYPTED_WORKLOAD}"
