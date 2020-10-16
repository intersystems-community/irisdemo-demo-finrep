#!/bin/bash
#
# This script is meant to support running the demo with Hyperledger
#


YELLOW="\033[1;33m"
BLUE="\033[1;34m"
PURPLE="\033[1;35m"
CYAN="\033[1;36m"
WHITE="\033[1;37m"
RESET="\033[0m"

WD=${PWD}
cd ./hyperledger/fabric-samples/test-network

printf "\n\n${PURPLE}Stopping Demo and Cleaning Up Test Network Configurations.${RESET}\n"
source network.sh down

cd $WD