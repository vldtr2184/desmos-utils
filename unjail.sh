#!/bin/bash

WALLET_NAME=desmos
DESMOSCLI="/root/go/bin/desmoscli"

while true; 
do 
    OPERATOR=$($BIN_FILE q staking delegations -o json --chain-id $CHAIN_ID $SELF_ADDR | jq -r .[].validator_address)
    STATUS=$($DESMOSCLI query staking validator $OPERATOR --trust-node -o json | jq -r .status)
    echo "Status $STATUS"
    if [[ "$STATUS" != "2" ]]; then
        echo "UNJAIL"
        $DESMOSCLI tx slashing unjail --from $WALLET_NAME --gas-adjustment="1.5" --gas="200000" --gas-prices="0.01udaric" --chain-id=morpheus-10000 -y
    fi
    sleep 300
done
