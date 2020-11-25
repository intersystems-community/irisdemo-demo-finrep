## 2.1.0 (November 25, 2020)
  - returning gitignore to it's original state
  - adding system-genesis-block foldere
  - Merge pull request #2 from intersystems-community/package-hyperledger
  - updating run and stop scripts, updating README, and adding hyperledger explorer images
  - cadding .env file to ensure network is named correctly
  - cleaning up package structure to use hperledgerw container
  - updating docker-compose-test-net file to set explicit Hyperledger Explorer version
  - adding link to Hyperledger Explorer to landing page
  - Merge branch 'master' into adding-hyperledger-adapter
  - adding updates to include saving reporting doc hashing to Hyperledger network
  - Improving demo landing page.
  - Enhancing demo landing page to show the Hyper Ledger components.
  - Adding a trailing new line to the message
  - Fixing bug on REST service
  - improving MortgageReportingAssetContract
  - Merge branch 'adding-hyperledger-adapter' of https://github.com/intersystems-community/irisdemo-demo-finrep into adding-hyperledger-adapter
  - adding non transaction method for testing purposes
  - Making sure the environment variables are being passed to the composition when starting the network
  - fixing git ignore so that it ignores any newly generated binaries
  - adding necessary Gradle JAr file for building without having gradle installed
  - adding necessary hyperledger binaries to run locally
  - updating documentation in hyperledger directory
  - readding hyperledger folder
  - removing old hyperledger folder
  - adding requirements for automating hyperledger network initialization
  - Merge branch 'master' into adding-hyperledger-adapter
  - adding hyperledger packages
  - Improving README
  - fixing merge conflict with docker-compose to include Amir's performance changes
  - adding resources for hyperledger

## 2.0.3 (October 07, 2020)
  - Not using relationships on FCA objects anymore. 
  - Added metrics to report generation. 
  - Removed some mortgage performance files so we don't have to wait too long for them to finish loading. Moving the invalid code error to April's performance file.

## 2.0.2 (October 06, 2020)
  - Fixing bug on business rule where 18 days was being used instead of 18 YEARS

## 2.0.1 (October 06, 2020)
  - Renaming TodayHorolog() to Today()
  - Fixing problem where ICM was deploying the demo without the volume FCAGeneratedReports

## 2.0.0 (October 06, 2020)
  - Adding business rules to the demo.
  - Fixing issue that was preventing the deployment with ICM on AWS
  - Adding warning to wait before trying the URL that ICM provides.
  - Making PSD 00* document icons on the demo landing page clickable so we can download these files when demoing from AWS.
  - Run is now purgin old generated reports after a demo is finished running.
  - Improving documentation

## 1.0.10 (October 02, 2020)
  - Improving performance of normalization process in 20% 

## 1.0.8 (October 02, 2020)
  - Fixing bumpbersion.sh
  - Documentation improvement

## 1.0.7 (October 02, 2020)
  - Implemented ICM based deployment on AWS
  - Making sure all links use /csp/user/

## 1.0.6 (October 01, 2020)
  - Making demo run on the USER namespace so we can deploy it with Durable %SYS using ICM on AWS

## 1.0.3 (October 01, 2020)
  - Making sure we are calling triggering file transfers and reports
  - Small performance changes. Making sure the scheduled reports get triggered from the demo landing page.
  - Fixing image ref on README.

## 1.0.2 (September 30, 2020)
  - Docker-compose configured to run IRIS on docker with cap_add IPC_LOCK and security_opt seccomp:unconfined to boost performance for the demo
  - Regulatory reporting shows just latest records. 
  - Run script cleans up CSV files.
  - New landing page added.
  - Creating dummy files so that the folders will exists on a clonned repo
  - Improved documentation

## 1.0.1 (September 25, 2020)

Initial version