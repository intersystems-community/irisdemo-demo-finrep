#!/bin/bash
#
# This script is meant to support running the speedtest with docker-compose
#
# You can:
# - call it without any arguments to run the speed test using IRIS. 
# - call it with an argument to run the speed test using another datbase. The available options are: 
#   - mysql
#
# Each option will lead to using a diffent docker-compose.yml file.
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
}

cleanup()
{
    printf "\n\n${PURPLE}CTRL+C detected. Removing containters...${RESET}\n"
    docker-compose stop
    docker-compose rm -f

    clean_files

    printf "\n\n${PURPLE}Cleaning up complete.${RESET}\n"
    trap - INT
}
trap cleanup INT

docker-compose stop
docker-compose rm -f

clean_files

docker-compose up --remove-orphans