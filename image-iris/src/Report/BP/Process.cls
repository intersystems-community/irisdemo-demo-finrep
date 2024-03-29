Include Ensemble

/// 
Class Report.BP.Process Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Report.BP.Request' response='Ens.Response' height='2200' width='2000' >
<context>
<property name='ReportSchedule' type='Report.ReportSchedule' instantiate='0' />
<property name='ReportScheduleRun' type='Report.ReportScheduleRun' instantiate='0' />
<property name='Action' type='%String' initialexpression='"Generate"' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='Message' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='2500' />
</parameters>
</property>
<property name='RecordCount' type='%Integer' instantiate='0' />
</context>
<sequence xend='200' yend='350' >
<while name='Generate Report' condition='context.Action="Generate"' xpos='200' ypos='250' xend='200' yend='1950' >
<scope xpos='200' ypos='250' xend='200' yend='1850' >
<assign name="Open/Create Report Schedule" property="context.ReportSchedule" value="##class(Report.ReportSchedule).%OpenId(request.ReportScheduleId,,.status)" action="set" xpos='200' ypos='350' />
<assign name="New Report Schedule Run" property="context.ReportScheduleRun" value="##class(Report.ReportScheduleRun).Create(context.ReportSchedule, process.%SessionId, .status)" action="set" xpos='200' ypos='450' />
<assign name="Reset record count" property="context.RecordCount" value="0" action="set" xpos='200' ypos='550' />
<code name='Transform Record' xpos='200' ypos='650' >
<![CDATA[ 
                        
        Try
        {
            Set collectMetrics = $Get(^reportMetrics)
            Set reportName=context.ReportScheduleRun.ReportRunUniqueName

            If collectMetrics 
            {
                Kill ^reportMetrics(reportName)
                Set tReportTimeStart=$Piece($ZTimeStamp,",",2) //DEL
                Set tGetResultSetTimeStart=$Piece($ZTimeStamp,",",2) //DEL
            }

            Set canonicalId = ""

            Set status = context.ReportScheduleRun.GetResultSet(.oRS)
            Quit:$$$ISERR(status)

            If collectMetrics 
            {
                Set tGetResultSetTimeEnd=$Piece($ZTimeStamp,",",2) //DEL
                Set ^reportMetrics(reportName,"GetResultSet")=$Get(^reportMetrics(reportName, "GetResultSet"))+(tGetResultSetTimeEnd-tGetResultSetTimeStart) //DEL 
                Set tDTLHeaderTimeStart=$Piece($ZTimeStamp,",",2) //DEL
            }

            /// Building the header of the document. Just need to call this one once. The header uses information from the Schedule
            /// This DTL creates the XML document with the right schema
            Set status = $classmethod(context.ReportScheduleRun.HeaderDTL, "Transform", context.ReportScheduleRun, .reportObjectTree)
            Quit:$$$ISERR(status)

            If collectMetrics 
            {
                Set tDTLHeaderTimeEnd=$Piece($ZTimeStamp,",",2) //DEL
                Set ^reportMetrics(reportName,"DTLHeader")=$Get(^reportMetrics(reportName, "DTLHeader"))+(tDTLHeaderTimeEnd-tDTLHeaderTimeStart) //DEL 
                Set tNextMsgStart=$Piece($ZTimeStamp,",",2) //DEL
            }

            // Tried to use this with XML VDocs to see if the memory issues would stop. But the memory issue happens during the %Save!
            // Set status = reportXMLDoc.CommittedMode()
            // Quit:$$$ISERR(status)

            While oRS.Next()
            {
                If collectMetrics 
                {
                    Set tNextMsgEnd=$Piece($ZTimeStamp,",",2) //DEL
                    Set ^reportMetrics(reportName,"NextMsg")=$Get(^reportMetrics(reportName, "NextMsg"))+(tNextMsgEnd-tNextMsgStart) //DEL 
                    Set tOpenMsgTimeStart=$Piece($ZTimeStamp,",",2) //DEL
                }

                Set canonicalId = oRS.GetData(1)

                Set canonicalObj = $classmethod(context.ReportScheduleRun.SourceCanonicalClassName, "%OpenId", canonicalId, , .status)
                Quit:$$$ISERR(status)

                If collectMetrics 
                {
                    Set tOpenMsgTimeEnd=$Piece($ZTimeStamp,",",2) //DEL
                    Set ^reportMetrics(reportName,"OpenMsg")=$Get(^reportMetrics(reportName, "OpenMsg"))+(tOpenMsgTimeEnd-tOpenMsgTimeStart) //DEL 
                    Set tDTLMsgTimeStart=$Piece($ZTimeStamp,",",2) //DEL
                }

                Set context.RecordCount=context.RecordCount+1

                /// Call this second transformation once per each canonical object. 
                /// This DTL will reuse the xml document and add a record to it for every canonical object opened by the query of the report.
                Set status = $classmethod(context.ReportScheduleRun.ContentsDTL, "Transform", canonicalObj, .reportObjectTree, context.RecordCount) 
                Quit:$$$ISERR(status)

                // Validate the first 10 objects just to fail fast in case of a data type validation problem
                If context.RecordCount<10
                {
                    Set status = reportObjectTree.%ValidateObject()
                    Quit:$$$ISERR(status)
                }

                If collectMetrics 
                {
                    Set tDTLMsgTimeEnd=$Piece($ZTimeStamp,",",2) //DEL
                    Set ^reportMetrics(reportName,"DTLMsg")=$Get(^reportMetrics(reportName, "DTLMsg"))+(tDTLMsgTimeEnd-tDTLMsgTimeStart) //DEL 
                    Set tNextMsgStart=$Piece($ZTimeStamp,",",2) //DEL
                }

                // For testing.
                //Quit:context.RecordCount=100
            }
            Quit:$$$ISERR(status)

        }
        Catch (oException)
        {
            Set status = $System.Status.AppendStatus($$$ERROR(5001,"Error occurred during DTL msg loop."), oException.AsStatus())
        }

        If $$$ISERR(status) 
        {
            If $Get(canonicalId)'=""
            {
                $$$LOGERROR("An error occurred when processing canonical ID "_canonicalId_" from class "_context.ReportScheduleRun.SourceCanonicalClassName_".")
            }

            $$$LOGSTATUS(status) 

            Set status2 = context.ReportScheduleRun.ChangeToErrorStatus($System.Status.GetErrorText(status), context.RecordCount)
            If $$$ISERR(status2) Set status = $System.Status.AppendStatus(status, status2)
            Quit
        }

        If context.RecordCount=0
        {
            Set status = $$$ERROR(5001,"The query has not returned any records to report!")
            Quit
        }

        $$$TRACE("Saving generated report.")

        If collectMetrics 
        {
            Set tSaveReportStart=$Piece($ZTimeStamp,",",2) //DEL
        }

        Set status = reportObjectTree.%Save()
        
        If collectMetrics 
        {
            Set tSaveReportEnd=$Piece($ZTimeStamp,",",2) //DEL
            Set ^reportMetrics(reportName,"SaveReport")=tSaveReportEnd-tSaveReportStart 
            Set ^reportMetrics(reportName,"FullProc")=tSaveReportEnd-tReportTimeStart

            Set ^reportMetrics(reportName,"DTLHeader%")        = (^reportMetrics(reportName, "DTLHeader")/^reportMetrics(reportName, "FullProc")*100)_"%" //DEL
            Set ^reportMetrics(reportName,"DTLMsg%")        = (^reportMetrics(reportName, "DTLMsg")/^reportMetrics(reportName, "FullProc")*100)_"%" //DEL
            Set ^reportMetrics(reportName,"OpenMsg%")        = (^reportMetrics(reportName, "OpenMsg")/^reportMetrics(reportName, "FullProc")*100)_"%" //DEL
            Set ^reportMetrics(reportName,"GetResultSet%")  = (^reportMetrics(reportName, "GetResultSet")/^reportMetrics(reportName, "FullProc")*100)_"%" //DEL
            Set ^reportMetrics(reportName,"NextMsg%") = (^reportMetrics(reportName, "NextMsg")/^reportMetrics(reportName, "FullProc")*100)_"%" //DEL
            Set ^reportMetrics(reportName,"SaveReport%")       = (^reportMetrics(reportName, "SaveReport")/^reportMetrics(reportName, "FullProc")*100)_"%" //DEL

            Set ^reportMetrics(reportName,"DTLHeaderAvg")        = (^reportMetrics(reportName, "DTLHeader")/context.RecordCount)_"s" //DEL
            Set ^reportMetrics(reportName,"DTLMsgAvg")        = (^reportMetrics(reportName, "DTLMsg")/context.RecordCount)_"s" //DEL
            Set ^reportMetrics(reportName,"OpenMsgAvg")        = (^reportMetrics(reportName, "OpenMsg")/context.RecordCount)_"s" //DEL
            Set ^reportMetrics(reportName,"GetResultSetAvg")  = (^reportMetrics(reportName, "GetResultSet")/context.RecordCount)_"s" //DEL
            Set ^reportMetrics(reportName,"NextMsgAvg") = (^reportMetrics(reportName, "NextMsg")/context.RecordCount)_"s" //DEL
            Set ^reportMetrics(reportName,"SaveReportAvg")       = (^reportMetrics(reportName, "SaveReport")/context.RecordCount)_"s" //DEL
        }

        If $$$ISERR(status)
        {
            $$$LOGERROR("An error occurred when trying to save the final report.")
            $$$LOGSTATUS(status)

            Set status2 = context.ReportScheduleRun.ChangeToErrorStatus($System.Status.GetErrorText(status), context.RecordCount)
            If $$$ISERR(status2) Set status = $System.Status.AppendStatus(status, status2)
        }
        Else
        {
            Set context.ReportScheduleRun.GeneratedReportObjectId=reportObjectTree.%Id()
        }
        
        
        
    ]]>
</code>
<trace name='Finished processing' value='"Finished processing "_context.RecordCount_" records."' xpos='200' ypos='750' />
<assign name="Close Report" property="status" value="context.ReportScheduleRun.ChangeToGeneratedStatus(context.RecordCount)" action="set" xpos='200' ypos='850' />
<trace name='Batch closed' value='"Batch closed."' xpos='200' ypos='950' />
<assign name="Done" property="context.Action" value="&quot;Done&quot;" action="set" xpos='200' ypos='1050' />
<call name='Send to FCA' target='Send to FCA' async='0' xpos='200' ypos='1150' >
<request type='Report.ReportScheduleRun' >
<assign property="callrequest" value="context.ReportScheduleRun" action="set" />
</request>
</call>
<if name='Cubes?' condition='context.ReportSchedule.Report.CubeList&apos;=""' xpos='200' ypos='1250' xend='200' yend='1500' >
<true>
<call name='Synchronize Cubes' target='Cube Operations' async='0' xpos='335' ypos='1400' >
<request type='Cube.BO.SynchronizeCubeListReq' >
<assign property="callrequest.CubeList" value="context.ReportSchedule.Report.CubeList" action="set" />
</request>
</call>
</true>
</if>
<call name='Send To Hyperledger' target='Hyperledger Reporting Operation' async='0' xpos='200' ypos='1600' >
<request type='Report.ReportScheduleRun' >
<assign property="callrequest" value="context.ReportScheduleRun" action="set" />
</request>
<response type='Hyperledger.BO.CreatePSD001Resp' />
</call>
<faulthandlers>
<catchall name='Report Generation error' xpos='200' ypos='1700' xend='200' yend='1250' >
<trace name='Report Generation problem' value='"Report Generation problem"' xpos='200' ypos='250' />
<assign name="Compose Message" property="context.Message" value="&quot;The following problem occurred when trying to process session &quot;_process.%SessionId_&quot;: &quot;_$System.Status.GetOneStatusText(..%Context.%LastError)" action="set" xpos='200' ypos='350' />
<alert value='context.Message' xpos='200' ypos='450' />
<call name='New Workflow Task' target='Data Stewards' async='1' xpos='200' ypos='550' >
<annotation><![CDATA[
                                Human Intervention Required
                                Sending request to a Data Steward 
                                ]]></annotation>
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Actions" value="&quot;Retry,Discard&quot;" action="set" />
<assign property="callrequest.%Subject" value="&quot;Report Generation Problem&quot;" action="set" />
<assign property="callrequest.%Message" value="context.Message" action="set" />
</request>
<response type='EnsLib.Workflow.TaskResponse' >
<assign property="context.Action" value="callresponse.%Action" action="set" />
</response>
</call>
<sync name='Wait for human intervention' calls='New Workflow Task' type='all' xpos='200' ypos='650' />
<if name='Retry?' condition='context.Action="Retry"' xpos='200' ypos='150' xend='470' yend='500' >
<true>
<trace name='Specialist asked to retry' value='"Specialist asked to retry"' xpos='470' ypos='300' />
<assign name="Retry generating report" property="context.Action" value="&quot;Generate&quot;" action="set" xpos='470' ypos='400' />
</true>
<false>
<trace name='Specialist asked to discard' value='"Specialist asked to discard"' xpos='200' ypos='300' />
<assign name="Close Batch" property="status" value="context.ReportScheduleRun.ChangeToDiscardedStatus()" action="set" xpos='200' ypos='400' />
</false>
</if>
</catchall>
</faulthandlers>
</scope>
</while>
</sequence>
</process>
}

}
