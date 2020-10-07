#!/bin/sh
source ./env.sh
source /ICMDurable/utils.sh

rm -f /ICMDurable/license/.DS_Store
rm -f /ICMDurable/license/replace_this_file_with_your_iris_key

provisionWorkarounds

if [ ! -f ./defaults.json ];
then
    printf "\n\n${RED}You must run setup.sh first.\n\n${RESET}"
    exit 1
fi

#
# Now we can provision
#
icm provision
exit_if_terraform_error "Provisioning the infrastructure failed."

printf "\n\n${GREEN}Configuring permissions of durable volumes...${RESET}\n\n"
icm ssh -command "sudo chown -R ubuntu:ubuntu /irissys"
exit_if_error "Could not configure permission of durable volumes! :("

printf "\n\n${GREEN}Copying merge.cpf...${RESET}\n\n"
icm scp -localPath ./merge.cpf -remotePath /irissys/data
exit_if_error "Could not copy merge.cpf file! :("

printf "\n\n${GREEN}Copying MortgageSystemFiles...${RESET}\n\n"
icm scp -localPath /MortgageSystemFiles -remotePath /irissys/data/MortgageSystemFiles
exit_if_error "Could not copy merge.cpf file! :("

printf "\n\n${GREEN}Configuring permissions MortgageSystemFiles...${RESET}\n\n"
icm ssh -command "sudo chmod u+rw,g+rw,o+rw -R /irissys/data/MortgageSystemFiles/"
exit_if_error "Could not configure permission of durable volumes! :("

printf "\n\n${GREEN}Deploying IRIS...${RESET}\n\n"
icm run -container demo -image intersystemsdc/irisdemo-demo-finrep:iris-version-$DEMO_VERSION -options "--init --privileged --publish 80:52773 --publish 52773:52773 --volume /irissys/data/MortgageSystemFiles:/MortgageSystemFiles --volume /irissys/wij:/dur/wij --volume /irissys/journal1:/dur/journal1 --volume /irissys/journal2:/dur/journal2 --volume /irissys/data:/dur/data --env ISC_DATA_DIRECTORY=/dur/data/iris.d --env ISC_CPF_MERGE_FILE=/dur/data/merge.cpf"
exit_if_error "Could not start demo container! :("

IP=$(icm inventory | awk "/$ICM_LABEL/{ print \$2 }")

printf "\n\n${YELLOW}Demo is available on http://$IP/csp/user/demo.csp.\n\n${RESET}"

printf "\n\n${YELLOW}WARNING: The above URL will not work right away. Please wait about 10 seconds or more before trying to open it.\n\n"