#!/bin/bash
#
# Use this script to start the demo. It will:
# 1- Start the Certificate Authority first.
# 2- Run a container to produce the certificates for our test organizations
# 3- Start the demo with the two organizations (org0 is the FCA and org1 is the bank)
#    on a single peer (peer0) and IRIS
# 4- Create a private channel for both organizations (the FCA and the bank)
# 5- Compile the chain code and deploy it on the channel. The chain code needs to be 
#    compiled when we are starting the demo because we are relying on original code of
#    shipped with the hyperledger SDK that uses graddle and shell scripts to compile and deploy
#    the chain code in an easy way. 
#
# We packaged the hyperledger SDK in an image called irisdemo-base-hyperledgerw. We use this image
# bellow on steps 2, 4 and 5
 
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
    printf "\n\n${PURPLE}CTRL+C detected. Removing containters...${RESET}\n"
    docker-compose down --volumes --remove-orphans
    docker-compose -f docker-compose-ca.yml down --remove-orphans

    docker run --rm --name hyperledgerw \
    --net host \
    -v `pwd`/hyperledger/organizations:/hyperledger/fabric-samples/test-network/organizations \
    -v `pwd`/hyperledger/system-genesis-block:/hyperledger/fabric-samples/test-network/system-genesis-block \
    intersystemsdc/irisdemo-base-hyperledgerw:latest cleanUp

    docker-compose rm -f

    clean_files

    printf "\n\n${PURPLE}Cleaning up complete.${RESET}\n"
    trap - INT
    exit
}

trap cleanup INT

clean_files

docker-compose -f docker-compose-ca.yml up -d

docker run --rm --name hyperledgerw \
--net host \
-v `pwd`/hyperledger/organizations:/hyperledger/fabric-samples/test-network/organizations \
-v `pwd`/hyperledger/system-genesis-block:/hyperledger/fabric-samples/test-network/system-genesis-block \
intersystemsdc/irisdemo-base-hyperledgerw:version-1.2.0 up -ca

docker-compose up -d

sleep 10

docker run --rm --name hyperledgerw \
--net host \
-v `pwd`/hyperledger/organizations:/hyperledger/fabric-samples/test-network/organizations \
-v `pwd`/hyperledger/system-genesis-block:/hyperledger/fabric-samples/test-network/system-genesis-block \
intersystemsdc/irisdemo-base-hyperledgerw:version-1.2.0 createChannel -c mychannel

docker run --rm --name hyperledgerw \
--net host \
-v `pwd`/hyperledger/organizations:/hyperledger/fabric-samples/test-network/organizations \
-v `pwd`/hyperledger/system-genesis-block:/hyperledger/fabric-samples/test-network/system-genesis-block \
-v `pwd`/hyperledger/chaincodes/mortgage-reporting-cc:/hyperledger/fabric-samples/mortgage-reporting-cc \
intersystemsdc/irisdemo-base-hyperledgerw:version-1.2.0 deployCC -ccn MortgageReportingAssetContract -ccl java

