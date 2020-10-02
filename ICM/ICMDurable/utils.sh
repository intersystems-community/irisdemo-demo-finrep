#!/bin/sh

RED="\033[1;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
PURPLE="\033[1;35m"
CYAN="\033[1;36m"
WHITE="\033[1;37m"
RESET="\033[0m"

exit_if_error() {

	if [ $? -ne 0 ];
	then
		printf "\n\n${RED}"
		echo "ERROR: $1"
		printf "\n\n${RESET}"
		exit 1
	fi
}

#
# Workaround for Prodlog 161538
#
prodlog161538() {
    # Always test first
    if [ ! -z "$(cat /ICM/etc/toHost/mountVolumes.sh | grep 1..26)" ];
    then 
        sed -i  "s/1..26/0..26/g" /ICM/etc/toHost/mountVolumes.sh
    fi
}

# provision.sh scripts instantiated from the template will call this every time they run
# in order to apply required workarounds for this stage. As ICM is started fresh every time 
# a new ICM container is started, we must always check and apply required workarounds
provisionWorkarounds() {
    prodlog161538
}

# deployiris.sh scripts instantiated from the template will call this every time they run
# in order to apply required workarounds for this stage. As ICM is started fresh every time 
# a new ICM container is started, we must always check and apply required workarounds
deployirisWorkarounds() {
    prodlog161538
}

exit_if_terraform_error() {

	if [ $? -ne 0 ];
	then
		printf "\n\n${RED}"
		echo "ERROR: $1"
		printf "\n${YELLOW}"
		cat */*/terraform.err

		printf "\n\n${RESET}"
		exit 1
	fi
}

exit_if_empty() {
    if [ -z "$1" ];
    then
        printf "\n\n${PURPLE}Exiting.${RESET}"
        exit 0
    fi
}