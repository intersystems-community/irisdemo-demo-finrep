# InterSystems IRIS Financial Regulatory Reporting Demo

A big financial prospect in the UK has asked us to demo how IRIS could help with Financial Regulatory Reporting to the [FCA](https://www.fca.org.uk) (Financial Conduct Authority).

The FCA has several regultatory reports touching several financial services products such as mortgages. Financial institutions must send the FCA periodic reports. Some of them may be monthly, quarterly or every semester. 

To prepare these reports, financial institutions must gather information coming from their legacy systems. If you take mortgages as an example, a typical legacy system may send you a file with all the **mortgage sales data** (new mortgages). Then, every month, the system may produce a file with **mortgage performance information** (how well customers are paying their monthly installments). 

Some financial institutions will even have more than one mortgage system due to aquisitions. That makes the problem even harder since regulators such as the FCA don't really care. The financial institution is responsible for reporting their mortage information. They don't care if the financial institution has one, two or 10 mortgages systems or if they all use different naming conventions and coding systems to represent the mortgage information and the performance data.

Some times the data may even arrive out of order: performance data may end up arriving before the mortgage sales data. That would mean we would have to store information about a mortgage that doesn't yet exist in our reporting framework.

This demo shows how InterSystems IRIS can be used to receive mortage information over files. The demo collates the mortgage data with the performance data independently of the order it arrives. The demo shows how InterSystems IRIS can prepare the data that could possibly be coming from different mortgage systems (although on this demo we have onlhy one source) by normalizing it on a canonical (specialized) model for mortgage reporting. Normalization means that:
* A field that was called by two or three different names on two or three different data sources is called by one single canonical name on the canonical model
* A field that was using two or three different coding systems on two or three different data sources will be using a single coding system required by the regulator (FCA dictates the codes, not the financial institution)

During this process, problems may arise and the demo shows how InterSystems IRIS can pause the proces and start a human workflow so that the problem may be resolved without disrupting the reporting schedule.

The demo also shows how reports can be scheduled to be run. In the demo, we are producing two reports:
* PSD 001 - New mortgages sold - reported quarterly
* PSD 007 - Mortgage performance data - reported every semester

Information about PSD 001 and PSD 007 can be found [here](https://www.fca.org.uk/firms/regulatory-reporting/product-sales-data-reporting). Reports must be generated following FCA's XML Schema for each report. We demonstrate how we can map the canonical model to the FCA schema of each report on this demo. When a report is generated, we leave its generated XML file on a folder. The FCA mantains a system called Gabriel (that is being replaced by a new system called RegData), that the financial institutions can use to submit their reports by uploading these files. The FCA also provides other ways to submit these reports such as SOAP APIs. 

The demo also shows how we can produce real time reporting about the information that is being sent by the legacy systems for preparing reports, and about the status of the FCA reports that are can be scheduled, overdue or delivered.

Once the report is sent to the FCA (over file uploading, SOAP, etc.), a validation process is started on Gabriel/RegData. Gabriel/RegData can reject the report which would cause a workflow to correct in Gabriel/RegData. The financial institution can correct it by using a Gabriel/RegData's UI or cancell that report and send a new one. **We are not showing this part of the process on this demo**.

Demo of InterSystems IRIS being used to:
* Parsing mortgage data coming in batch files using our **Record Mapper** UI
* Collating and normalizing records into a canonical model using **DTL** and **Lookups** 
* Dealing with errors in the data with human **Workflows**
* Configuration of reports that will pull information from the canonical model and transform it to UK's FCA schemas for [PSD 001 and PSD 007](https://www.fca.org.uk/firms/regulatory-reporting/product-sales-data-reporting) reporting.
* Monitoring of incoming batches and scheduled report statuses using **dashboards**
* Showing **full traceability** of batches and report generation
* Interoperate with Hyperledger to submit a report. We do that by running a transaction on a smart contract.


## How to run the demo

**WARNING: If you are running on a Mac or Windows, you must give Docker at least 5Gb of RAM for this demo to run properly. Also, please check this [troubleshooting](https://github.com/intersystems-community/irisdemo-base-troubleshooting) document in case you find problems starting the demo with docker-compose. Disk space available for the docker VM is the most common cause for trouble.**

To run the demo on your PC, make sure you have **Git** and **Docker** installed on your machine. 

Clone this repository to your local machine to get the entire source code. Don't worry, you don't need to rebuild the demo from its source. It is just easier this way. After cloning the repo, change to its directory and start the demo:

```bash
git clone https://github.com/intersystems-community/irisdemo-demo-finrep
cd irisdemo-demo-finrep
docker-compose up
```

Another approach is tu use the **run.sh** script. This script will make sure the containers are removed before you start the demo and also after you are finished with the demo. It will also clean up generated report files and the files that are moved to the Done folders. Using the run.sh script is a good way to always start fresh and keep everything clean.

When starting, you will see lots of messages from all the containers that are starting. That is fine. Don't worry!

When it is done, it will just hang there, without returning control to you. That is fine too. Just leave this window open. If you CTRL+C on this window, docker compose will stop all the containers and stop the demo.

After all the containers have started, open a browser at [http://localhost:10000/csp/user/demo.csp](http://localhost:10000/csp/appint/demo.csp) to see the landing page of the demo. When requested, use the credentials **SuperUser/sys** to log in. 

You are going to see a page like this:

![Demo](https://github.com/intersystems-community/irisdemo-demo-finrep/blob/master/image-iris/html/landing-page.png?raw=true)

This is the landing page of the demo. All the icons on this image are clickable. To open th hyper ledger explorer, click on the hyper ledger icon
at the very right of the screen. Use the credentials **exploreradmin/exploreradminpw**.

How to demo the demo
This demo has a flow. You should start by clicking on the orange square at the right to start pumping the files in. Then you can start clicking on the components that are processing these files from left to right including:
* The adapter - make the point that we have many adpters, but on this demo we are using files. Use the preview feature of the Record Mapper to open a file on /MortageSystemFiles/Trans/Originals/ and show the contents of the file.
* The process - make sure you tell them that should their process be different, we can easily adapt. It is a low code approach for business process orchestration. Don't worry about explaining what each activity on the process is doing. Just scroll and let them see the diagram. Make the point that the process is calling the transformations, lookups and business rules and get out
* The DTL - transforms legacy data into the canonical structure and calls the look up tables
* Look Up Table - show an example that is being applied (in this case, this example is used for processing the mortgage performance data)
* Business Rules - show an example

Now stop. Don't touch the canonical model just yet. Move on to the control plane. Try to keep your tabs closed. You can always open them up again with ease by using the demo landing page:
* Workflow - All this time you have been showing things, the files have been processed. So open the Workflow Inbox and show there is an issue with one of the files and the process has stopped. Accept the task.
* Monitoring Dashboard - Show that the problem appears on the dashboard as well. Take time to Explain the dashboard. Show that you can click on the error on the dashboard and ask for the detail listing. You can select that item and click on trace so you will be taken to the Visual Trace of the problem.
* Visual Trace - explain the visual trace and that you can chose to keep months or years worth of trace which is very valuable for forensics and for explaining to internal peers and regulators what happened in any situation. Show that the last action is the worklow task that is sitting and waiting for an action from the Data Steward.
* Fix the problem - by adding the missing mapping from the bad string to the code "O" on the lookup table
* Retry - Use the workflow inbox to trigger the retry.
* Visual Trace again - show that visual trace got updated and shows the Data Steward's response and the processing continued

Now move to the canonical model and show how the data has been collated on the tables Canonical.Mortgage, Canonical.MortgagePerf and Canonical.MortgageAfford.

Go back to the monitoring dashboard and show that we have lots of files loaded. The error is gone. But our reports are overdue! Time to generate some reports.

Show the report schedule on the control plane. Click on the PSD001 report to start its generation. Don't show the trace just yet. Move up to the Report Generation (upper right) part of the demo landing page:
* Process - Click on the process to show that this step too is also guided by a process. They may implement their own process to implement their own way of working. Depending on the country, the regulator may reject a report and your process could keep going and open an workflow ticket with the Regulatory Report Manager to look into this problem. The entire conversation with the regulation can be orchestrated from here.
* DTL - Make the point that when we schedule a report, we assign a DTL to extract the required data from the canonical model. That is very useful because, typically, regulators will evolve their schemas and we don't want to keep changing our canonical model and integrations too much. So, although the canonical model may have started looking a lot like the initial schema provided by the regulator, it may drift with time and that is ok. We are ready to deal with that.
* Analytics - While the report is being generated, invite them to see "one more thing". Make the point that you are probablly aggregating data from more than one source. Some financial institutions have more than one mortgage system as well, due to acquisitions. So now you have clean and normalized data form all these systems on your canonical/conceptual model. Why not take advantage of it? Click on the analytics icon on the control plane. Show the cube. Open Analyzer and build a simple pivot. Make the point that this cube is being kept current with the data that is coming in from the legacy systems and may be useful in many situations such as: 1) To support the data steward during the process of building the smart service (the data pipeline). He/she may be looking at the data to evaluate its quality. 2) To build operational dashboards for the business; 3) To build dashboards to support the Regulatory Report Manager in his/her conversations with the regulators; 4) Make the poin that they can also use their preferred tools such as Tableau, Power BI, etc.
* Trace - By now, the report is fully generated. Now click on the Data Traceability icon on the control plane to show the full message trace for the first time. Make the point that everything we do is recorded there. It is useful for foresics. We have loaded several files as the list of message traces will show. Our report generation request is there. Open it. It should be done by now. You should be able to open your Finder/Explorer and go to the folder FCAGeneratedReports and show the XML there. It is useful to open the file and show it. They will recognize the fields.

Make the point that this schedule is actually a schedule. We are triggering the report by hand because this is a demo. But, typically, the report would be triggered automatically unless there is a data acquisition problem.

Finally, make sure to open the Monitoring Dashboard one last time to show that the PSD 001 report is not overdue anymore. It is delivered.

You can generate the PSD 007 report if you want. It will work. But it may not be necessary. You have shown a lot already. 

[Here](https://web.microsoftstream.com/video/4f3ed7b2-aa7c-4eb1-a8a0-e67761fffd51) is a video I recorded where I am presenting this demo with some comments and recommendations. I am using the PPT that is also available bellow in Relevant Resources.

# Where can I find the source files?

When you clonned this git repository, you will notice that there is a folder named **MortgageSystemFiles**. Here is the structure of this folder:
* **/MortgageSystemFiles/Trans** - Mortgage transactions data
* **/MortgageSystemFiles/Afford** - Mortgage affordability information data
* **/MortgageSystemFiles/Perf** - Mortgsage performance data

When you click on the **February** blue ballon, the demo will:
* Copy the files from /MortgageSystemFiles/Trans/**Originals**/\*.csv into /MortgageSystemFiles/Trans/**In**/\*.csv 
* Copy the files from /MortgageSystemFiles/Afford/**Originals**/\*.csv into /MortgageSystemFiles/Afford/**In**/\*.csv

So you can look at the files if you want. They will be copied together and InterSystems IRIS will pick them up. The order that it picks them up doesn't really matter and may vary. That happens with typical production systems and this demo has been designed to deal with that.

Loading these two files takes a couple of minutes since we are also validating data types and validating the codes of coded fields to match the ones that the canonical model accepts (in order to guarantee proper reporting to the FCA later).

A similar process will start when you click on the second blue baloon except that now, what is going to be copied are the performance files on the /MortgageSystemFiles/Perf/**Originals**/\*.csv folder.

# The flow of the demo

This demo has a flow. You should start by clicking on the orange square at the right to start pumping the files in. 
Then you can start clicking on the components that are processing these files from left to right including:
* The adapter - make the point that we have many adpters, but on this demo we are using files. Use the preview feature of the Record Mapper to open a file on /MortageSystemFiles/Trans/Originals/ and show the contents of the file.
* The process - make sure you tell them that should their process be different, we can easily adapt. It is a low code approach for business process orchestration. Don't worry about explaining what each activity on the process is doing. Just scroll and let them see the diagram. Make the point that the process is calling the transformations, lookups and business rules and get out
* The DTL - transforms legacy data into the canonical structure and calls the look up tables
* Look Up Table - show an example that is being applied (in this case, this example is used for processing the mortgage performance data)
* Business Rules - show an example

Now stop. Don't touch the canonical model just yet. Move on to the control plane. Try to keep your tabs closed. You can always open them up again with ease by using the demo landing page:
* Workflow - All this time you have been showing things, the files have been processed. So open the Workflow Inbox and show there is an issue with one of the files and the process has stopped. Accept the task. 
* Monitoring Dashboard - Show that the problem appears on the dashboard as well. Take time to Explain the dashboard. Show that you can click on the error on the dashboard and ask for the detail listing. You can select that item and click on trace so you will be taken to the Visual Trace of the problem.
* Visual Trace - explain the visual trace and that you can chose to keep months or years worth of trace which is very valuable for forensics and for explaining to internal peers and regulators what happened in any situation. Show that the last action is the worklow task that is sitting and waiting for an action from the Data Steward.
* Fix the problem - by adding the missing mapping from the bad string to the code "O" on the lookup table
* Retry - Use the workflow inbox to trigger the retry. 
* Visual Trace again - show that visual trace got updated and shows the Data Steward's response and the processing continued

Now move to the canonical model and show how the data has been collated on the tables Canonical.Mortgage, Canonical.MortgagePerf and Canonical.MortgageAfford. 

Go back to the monitoring dashboard and show that we have lots of files loaded. The error is gone. But our reports are overdue! Time to generate some reports.

Show the report schedule on the control plane. Click on the PSD001 report to start its generation. Don't show the trace just yet. Move up to the Report Generation (upper right) part of the demo landing page:
* Process - Click on the process to show that this step too is also guided by a process. They may implement their own process to implement their own way of working. Depending on the country, the regulator may reject a report and your process could keep going and open an workflow ticket with the Regulatory Report Manager to look into this problem. The entire conversation with the regulation can be orchestrated from here.
* DTL - Make the point that when we schedule a report, we assign a DTL to extract the required data from the canonical model. That is very useful because, typically, regulators will evolve their schemas and we don't want to keep changing our canonical model and integrations too much. So, although the canonical model may have started looking a lot like the initial schema provided by the regulator, it may drift with time and that is ok. We are ready to deal with that.
* Analytics - While the report is being generated, invite them to see "one more thing". Make the point that you are probablly aggregating data from more than one source. Some financial institutions have more than one mortgage system as well, due to acquisitions. So now you have clean and normalized data form all these systems on your canonical/conceptual model. Why not take advantage of it? Click on the analytics icon on the control plane. Show the cube. Open Analyzer and build a simple pivot. Make the point that this cube is being kept current with the data that is coming in from the legacy systems and may be useful in many situations such as: 1) To support the data steward during the process of building the smart service (the data pipeline). He/she may be looking at the data to evaluate its quality. 2) To build operational dashboards for the business; 3) To build dashboards to support the Regulatory Report Manager in his/her conversations with the regulators; 4) Make the poin that they can also use their preferred tools such as Tableau, Power BI, etc.
* Trace - By now, the report is fully generated. Now click on the **Data Traceability** icon on the control plane to show the full message trace for the first time. Make the point that everything we do is recorded there. It is useful for foresics. We have loaded several files as the list of message traces will show. Our report generation request is there. Open it. It should be done by now. You should be able to open your Finder/Explorer and go to the folder FCAGeneratedReports and show the XML there. It is useful to open the file and show it. They will recognize the fields.

Make the point that this schedule is actually a schedule. We are triggering the report by hand because this is a demo. But, typically, the report would be triggered automatically unless there is a data acquisition problem.

Finally, make sure to open the Monitoring Dashboard one last time to show that the PSD 001 report is not overdue anymore. It is delivered.

You can generate the PSD 007 report if you want. It will work. But it may not be necessary. You have shown a lot already.

# Where are the reports being generated

You can infer this from looking at the production configuration. The Business Operation **Send to FCA** will give you this information. When you clonned this repository, a folder called **\FCAGeneratedReports** will be there. This is the folder where the reports will be generated as you run the demo.

# Can I send the files more than once?

Yes.

That may actually be a good point to make on the demo. Some times, you may find a problem with a file and the human workflow will start. You, as the data steward, may decide to discard that file and just ask the legacy system to send a new one. The demo can be used to show this workflow. 

Actually, one of the performance fileas comes with an error. Line 15 of the file for january brings an invalid code for column **LegacyReasonForClosure**. The demo suggests you to simply correct the lookup table for this column to add a new mapping for this invalid code and retry processing the same file. 

Another approach you could use would be to:
* Discard the file during the workflow processing
* Open the january file, and change the code for line 15, column LegacyReasonForClosure to a code that the system actually recoginizes
* Resent the same file

The process above will work as well and can be used to demonstrate this second workflow.

# Can I run the demo on AWS?

Yes!

Follow instructions [here](./ICM/README.md)

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
