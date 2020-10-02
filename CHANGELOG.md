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