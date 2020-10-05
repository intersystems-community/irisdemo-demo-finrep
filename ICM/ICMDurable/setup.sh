#!/bin/sh

source /ICMDurable/utils.sh
source /ICMDurable/base_env.sh

export SSH_DIR=/ICMDurable/keys
export TLS_DIR=/ICMDurable/keys

if [ ! -d ./keys ];
then
    printf "\n\n${GREEN}Generating SSH keys on $SSH_DIR:\n${RESET}"
    /ICM/bin/keygenSSH.sh $SSH_DIR

    printf "\n\n${GREEN}Generating TLS keys on $TLS_DIR:\n${RESET}"
    /ICM/bin/keygenTLS.sh $TLS_DIR
fi

#
# Setting up LABEL for our machines
#

printf "\n\n${GREEN}Please enter with the label for your ICM machines (ex: asamaryTest1): ${RESET}"
read ICM_LABEL
exit_if_empty $ICM_LABEL

if [ ! -d /ICMDurable/Deployments ];
then
    mkdir /ICMDurable/Deployments
fi

DEPLOYMENT_FOLDER=/ICMDurable/Deployments/$ICM_LABEL

rm -rf $DEPLOYMENT_FOLDER
mkdir $DEPLOYMENT_FOLDER

echo "export DEPLOYMENT_FOLDER=${DEPLOYMENT_FOLDER}" >> $DEPLOYMENT_FOLDER/env.sh
echo "export SSH_DIR=${SSH_DIR}" >> $DEPLOYMENT_FOLDER/env.sh
echo "export TLS_DIR=${TLS_DIR}" >> $DEPLOYMENT_FOLDER/env.sh
echo "export ICM_LABEL=$ICM_LABEL" >> $DEPLOYMENT_FOLDER/env.sh
echo "export DEMO_VERSION=$DEMO_VERSION" >> $DEPLOYMENT_FOLDER/env.sh


printf "\n\n${YELLOW}Please enter with your docker credentials so we can pull the IRIS image from your private docker hub repository.${RESET}\n"
printf "\n\n${GREEN}Docker Hub username?: ${RESET}"
read DOCKER_USERNAME
exit_if_empty $DOCKER_USERNAME

printf "\n\n${GREEN}Docker Hub password?: ${RESET}"
read -s DOCKER_PASSWORD
exit_if_empty $DOCKER_PASSWORD

echo "export DOCKER_USERNAME=$DOCKER_USERNAME" >> $DEPLOYMENT_FOLDER/env.sh
echo "export DOCKER_PASSWORD=$DOCKER_PASSWORD" >> $DEPLOYMENT_FOLDER/env.sh

#
# Making changes to the template accordingly to user choices
#

cp ./Template/AWS/defaults.json $DEPLOYMENT_FOLDER/
cp ./Template/AWS/merge.cpf $DEPLOYMENT_FOLDER/

sed -E -i  "s;<Label>;$ICM_LABEL;g" $DEPLOYMENT_FOLDER/defaults.json
sed -E -i  "s;<DockerUsername>;$DOCKER_USERNAME;g" $DEPLOYMENT_FOLDER/defaults.json
sed -E -i  "s;<DockerPassword>;$DOCKER_PASSWORD;g" $DEPLOYMENT_FOLDER/defaults.json

#
# Creating definitions.json file
#
    echo "
    [
        {
        \"Role\": \"DM\",
        \"Count\": \"1\",
        \"LicenseKey\": \"iris.key\"
        } 
    ]">> $DEPLOYMENT_FOLDER/definitions.json

rm -f $DEPLOYMENT_FOLDER/defaults.json.bak

#
# Copying additional scripts and making them executable
#
cp ./Template/template_provision.sh $DEPLOYMENT_FOLDER/provision.sh
chmod +x $DEPLOYMENT_FOLDER/provision.sh

cp ./Template/template_unprovision.sh $DEPLOYMENT_FOLDER/unprovision.sh
chmod +x $DEPLOYMENT_FOLDER/unprovision.sh

#
# Reminding user of the requirement for AWS credential files
#
if [ ! -f ./aws.credentials ];
then
    printf "\n\n${YELLOW}Put your AWS credentials on file aws.credentials${RESET}\n\n"

    echo "[default]" >> ./aws.credentials
    echo "aws_access_key_id = <your aws access key>" >> ./aws.credentials
    echo "aws_secret_access_key = <your aws secret access key>" >> ./aws.credentials
    echo "aws_session_token = <your aws session token>" >> ./aws.credentials
fi

printf "\n\n${YELLOW}You can now change to $DEPLOYMENT_FOLDER and run ./provision.sh to provision the infrastructure on AWS.\n\n${RESET}"