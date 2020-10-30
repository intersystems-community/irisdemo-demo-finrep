#!/bin/bash

ICM_TAG=$(cat ./ICMDurable/CONF_ICM_TAG) 
ICM_REPO=$(cat ./ICMDurable/CONF_ICM_REPO)
ICM_REGISTRY=$(cat ./ICMDurable/CONF_ICM_REG) 

clear

printf "\nStarting ICM with $ICM_REGISTRY/$ICM_REPO:$ICM_TAG...\n"
docker run --rm -it -v $PWD/../MortgageSystemFiles:/MortgageSystemFiles -v $PWD/ICMDurable:/ICMDurable --cap-add SYS_TIME $ICM_REGISTRY/$ICM_REPO:$ICM_TAG
printf "\nExited icm container\n"

