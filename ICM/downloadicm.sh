#!/bin/bash

export ICM_REPO=$(cat ./ICMDurable/CONF_ICM_REPO)
export ICM_TAG=$(cat ./ICMDurable/CONF_ICM_TAG) 
export ICM_REGISTRY=$(cat ./ICMDurable/CONF_ICM_REG) 

#
# CONSTANTS
#
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# checkError(errorMsg, successMsg)
# 
# If last command terminated with an error, prints errorMsg and exits with error returned.
# IF last command did not terminated with an error, prints successMsg.
function checkError() {
    if [ ! $? -eq 0 ]
    then 
        printf "${RED}\n$1\n${NC}"
        exit $?
    else
        if [ ! -z "$2" ]
        then
            printf "\n${GREEN}$2${NC}\n"
        fi
    fi
}

# dockerLogin <docker registry url>
#
# Can receive one parameter with the docker registry to log in to. Ex:
#
#   dockerLogin docker.iscinternal.com
#
# If no parameter is given, will do the docker login on Docker Hub.
#
function dockerLogin() {
    printf "\n\nDocker Credentials:\n"
    printf "\n\tLogin   : "
    read dockerUsername
    printf "\tPassword: "
    stty -echo
    read dockerPassword
    stty echo
    printf "\n\n"

    if [ -z "$dockerUsername" ]
    then
        printf "\n\n${RED}ABORTING: Docker username is required.${NC}\n\n"
        exit 1
    fi

    if [ -z "$dockerPassword" ]
    then
        printf "\n\n${RED}ABORTING: Docker password is required${NC}\n\n"
        exit 1
    fi

    printf "\n\n${YELLOW}Logging in...${NC}\n"
    if [ -z "$1" ]
    then
        printf "\n\n${YELLOW}Trying to log in on docker hub...${NC}\n"
        docker login -u $dockerUsername -p $dockerPassword
    else
        printf "\n\n${YELLOW}Trying to log in on $1...${NC}\n"
        docker login -u $dockerUsername -p $dockerPassword $1
    fi
    checkError "Login failed." "Login successful!"
}

#
# MAIN
#

printf "\n\n${YELLOW}Loggin into https://containers.intersystems.com to download newer images...${NC}\n"
printf "${YELLOW}You must use the encrypted password provided by https://containers.intersystems.com.${NC}\n"
printf "${YELLOW}Open https://containers.intersystems.com on your browser, login with your InterSystems account${NC}\n"
printf "${YELLOW}and you should get the password string.${NC}\n"
dockerLogin https://$ICM_REGISTRY

printf "\n\n${YELLOW}docker pull $ICM_REPO:$ICM_TAG${NC}\n"
docker pull $ICM_REGISTRY/$ICM_REPO:$ICM_TAG
checkError "ICM Pull failed." "Pull successful!"