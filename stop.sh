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

printf "\n\n${PURPLE}Stopping Demo.${RESET}\n"
docker-compose down --volumes --remove-orphans

docker-compose -f docker-compose-ca.yml down --remove-orphans

printf "\n\n${PURPLE}Cleaning Up Test Network Configurations.${RESET}\n"

docker run --rm --name hyperledgerw \
--net host \
-v `pwd`/hyperledger/organizations:/hyperledger/fabric-samples/test-network/organizations \
-v `pwd`/hyperledger/system-genesis-block:/hyperledger/fabric-samples/test-network/system-genesis-block \
-v `pwd`/hyperledger/chaincodes/mortgage-reporting-cc:/hyperledger/fabric-samples/mortgage-reporting-cc \
intersystemsdc/irisdemo-base-hyperledgerw:version-1.2.0 cleanUp