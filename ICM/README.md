# Running the HTAP Speed Test on AWS using ICM

We are using [InterSystems Cloud Manager (ICM)](https://docs.intersystems.com/irislatest/csp/docbook/Doc.View.cls?KEY=GICM_oview) to provision this demo on AWS.

ICM is built on top of Terraform and allows you to declare your infrastructure as code (a very simple JSON file) and to provision it. ICM also allows you to deploy InterSystems IRIS in this infrastructure in a variety of configurations:
* A simple InterSystems IRIS database server
* An InterSystems IRIS database server with a replica (mirror) on a second availability zone (data center)
* A full blown InterSystems IRIS database server with shards and compute nodes
* etc.

# Pre-Requisites

To run the demo with InterSystems IRIS on AWS, you will need:
* Basic understanding of AWS EC2 
* An AWS account 
* Git installed on your machine so you can clone this repository on your local PC
* Docker installed on your machine so you can run ICM

# Preparing the Environment

## 1. Clonning the repo

Clone this repository to your git folder on your PC:

```bash
git clone https://github.com/intersystems-community/irisdemo-demo-finrep
```

## 3. Preparing ICM to be run and InterSystems IRIS to be deployed

If you don't have ICM, use the script **downloadicm.sh** to download it. The version of ICM this scripts downloads is defined by the file **ICM/ICMDurable/CONF_ICM_TAG**. It comes with a reasonable default. Just follow
the instructions given by the script and you should have ICM downloaded on your PC in no time.

## 4. Configuring AWS Credentials

You must add your AWS Credential to file ICM/ICMDurable/aws.credentials. It looks like this:

```
[default]
aws_access_key_id = ABCDEFGHIJKLMNOPQRSTUVWXYZ
aws_secret_access_key = dsfsDFSDFSDSD4534534FDG4FDGD
aws_session_token = A_VERY_LARGE_STRING_ENDED_WITH==
```

## 5. Deploying and Running the Demo

Run the script **icm.sh**. Once inside ICM:
* Change to the folder /ICMDurable
* Run the script **./setup.sh**
* Change to the folder /ICMDurable/Deployments/<YourDeploymentLabel>
* Run the script **./provision.sh**
* At the end of this script, you should get an URL for the demo landing page. Wait a couple of minutes before using it.
  IRIS is expanding its USER database to 10Gb and this takes time.

## 6. Unprovisioning the demo

When you are done with the demo, run the script **./unprovision.sh**

