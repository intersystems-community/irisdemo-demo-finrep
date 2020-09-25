# InterSystems IRIS Financial Regulatory Reporting Demo

Demo of InterSystems IRIS being used to:
* Parsing mortgage data coming in batch files using our **Record Mapper** UI
* Collating and normalizing records into a canonical model using **DTL** and **Lookups** 
* Dealing with errors in the data with human **Workflows**
* Configuration of reports that will pull information from the canonical model and transform it to UK's FCA schemas for [PSD 001 and PSD 007](https://www.fca.org.uk/firms/regulatory-reporting/product-sales-data-reporting) reporting.
* Monitoring of incoming batches and scheduled report statuses using **dashboards**
* Showing **full traceability** of batches and report generation

## How to run the demo

**WARNING: If you are running on a Mac or Windows, you must give Docker at least 5Gb of RAM for this demo to run properly. Also, please check this [troubleshooting](https://github.com/intersystems-community/irisdemo-base-troubleshooting) document in case you find problems starting the demo with docker-compose. Disk space available for the docker VM is the most common cause for trouble.**

To run the demo on your PC, make sure you have **Git** and **Docker** installed on your machine. 

Clone this repository to your local machine to get the entire source code. Don't worry, you don't need to rebuild the demo from its source. It is just easier this way. After cloning the repo, change to its directory and start the demo:

```bash
git clone https://github.com/intersystems-community/irisdemo-demo-finrep
cd irisdemo-demo-finrep
docker-compose up
```

When starting, you will see lots of messages from all the containers that are starting. That is fine. Don't worry!

When it is done, it will just hang there, without returning control to you. That is fine too. Just leave this window open. If you CTRL+C on this window, docker compose will stop all the containers and stop the demo.

After all the containers have started, open a browser at [http://localhost:10000/csp/appint/demo.csp](http://localhost:10000/csp/appint/demo.csp) to see the landing page of the demo. When requested, use the credentials **SuperUser/sys** to log in. 

You are going to see a page like this:

![Demo](https://raw.githubusercontent.com/intersystems-community/irisdemo-demo-finrep/master/image-iris/html/landing-page.png?token=ABQT2JHUTZEPLAID2N4ZGT27NZV46)

This is the landing page of the demo. All the ballons on this image are clickable. Click on the **Toggle Detailed View** to show more information. 

The idea is that as you give the demo, you click on each balloon from left to right.

# Other demo applications

There are other IRIS demo applications that touch different subjects such as NLP, ML, Integration with AWS services, Twitter services, performance benchmarks etc. Here are some of them:
* [HTAP Demo](https://github.com/intersystems-community/irisdemo-demo-htap) - Hybrid Transaction-Analytical Processing benchmark. See how fast IRIS can insert and query at the same time. You will notice it is up to 20x faster than AWS Aurora!
* [Twitter Sentiment Analysis](https://github.com/intersystems-community/irisdemo-demo-twittersentiment) - Shows how IRIS can be used to consume Tweets in realtime and use its NLP (natural language processing) and business rules capabilities to evaluate the tweet's sentiment and the metadata to make decisions on when to contact someone to offer support.
* [HL7 Appointments and SMS (text messages) application](https://github.com/intersystems-community/irisdemo-demo-appointmentsms) -  Shows how IRIS for Health can be used to parse HL7 appointment messages to send SMS (text messages) appointment reminders to patients. It also shows real time dashboards based on appointments data stored in a normalized data lake.
* [The Readmission Demo](https://github.com/intersystems-community/irisdemo-demo-readmission) - Patient Readmissions are said to be the "Hello World of Machine Learning" in Healthcare. On this demo, we use this problem to show how IRIS can be used to **safely build and operationalize** ML models for real time predictions and how this can be integrated into a random application. This **IRIS for Health** demo seeks to show how a full solution for this problem can be built.
* [Fraud Prevention](https://github.com/intersystems-community/irisdemo-demo-fraudprevention) - Apply Machine Learning and Business Rules to prevent frauds in financial services transactions using InterSystems IRIS.
* [Financial Transactions with Fraud and Rewards/cross-sell](https://github.com/intersystems-community/irisdemo-demo-finsrv-crosssell) - Process credit card transactions while keeping a hot data lake current with data aggregated from your core systems. Use this aggregated data to prevent frauds and verify customer elegibility for for rewards as an example of cross-selling. 


# Report any Issues

Please, report any issues on the [Issues section](https://github.com/intersystems-community/irisdemo-demo-kafka/issues).
