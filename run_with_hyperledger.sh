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

clean_files()
{
    printf "\n\n${PURPLE}Removing CSV files...${RESET}\n"
    rm -f ./MortgageSystemFiles/Trans/In/*.csv
    rm -f ./MortgageSystemFiles/Afford/In/*.csv
    rm -f ./MortgageSystemFiles/Perf/In/*.csv
    rm -f ./MortgageSystemFiles/Trans/Done/*csv*
    rm -f ./MortgageSystemFiles/Afford/Done/*csv*
    rm -f ./MortgageSystemFiles/Perf/Done/*csv*

    rm -f ./FCAGeneratedReports/*.xml
    rm -f ./FCAGeneratedReports/*.zip

    printf "\n\n${PURPLE}Removing Hyperledger Wallet Identities...${RESET}\n"
    rm -f ./image-iris/hyperledger-wallet/*id
}

cleanup()
{
    printf "\n\n${PURPLE}CTRL+C detected. Stopping Hypelderger Network, Removing containters, Cleaning Up Network Configurations${RESET}\n"

    source network.sh down

    printf "\n\n${PURPLE}Cleaning up complete.${RESET}\n"
    trap - INT
}

clean_files

WD=${PWD}
cd ./hyperledger/fabric-samples/test-network

trap cleanup INT

printf "\n\n${PURPLE}CTRL+C detected. Bringin up Hyperledger Test Network and Creating channel - mychannel${RESET}\n"
source network.sh up createChannel -ca -c mychannel 

printf "\n\n${PURPLE}Deploying MortgageReporting Chaincode to peer nodes on Hyperldger Network${RESET}\n"
source network.sh deployCC -ccn MortgageReportingAssetContract -ccl java

cd $WD
