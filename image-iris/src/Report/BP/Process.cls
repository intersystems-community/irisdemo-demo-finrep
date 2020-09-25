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
<while name='Generate Report' condition='context.Action="Generate"' xpos='200' ypos='250' xend='200' yend='1500' >
<scope xpos='200' ypos='250' xend='200' yend='1400' >
<assign name="Open/Create Report Schedule" property="context.ReportSchedule" value="##class(Report.ReportSchedule).%OpenId(request.ReportScheduleId,,.status)" action="set" xpos='200' ypos='350' />
<assign name="New Report Schedule Run" property="context.ReportScheduleRun" value="##class(Report.ReportScheduleRun).Create(context.ReportSchedule, process.%SessionId, .status)" action="set" xpos='200' ypos='450' />
<assign name="Reset record count" property="context.RecordCount" value="0" action="set" xpos='200' ypos='550' />
<code name='Transform Record' xpos='200' ypos='650' >
<![CDATA[ 
                        
        Try
        {
            Set canonicalId = ""

            Set status = context.ReportScheduleRun.GetResultSet(.oRS)
            Quit:$$$ISERR(status)

            /// Building the header of the document. Just need to call this one once. The header uses information from the Schedule
            /// This DTL creates the XML document with the right schema
            Set status = $classmethod(context.ReportScheduleRun.HeaderDTL, "Transform", context.ReportScheduleRun, .reportObjectTree)
            Quit:$$$ISERR(status)

            // Tried to use this with XML VDocs to see if the memory issues would stop. But the memory issue happens during the %Save!
            // Set status = reportXMLDoc.CommittedMode()
            // Quit:$$$ISERR(status)

            While oRS.Next()
            {
                Set canonicalId = oRS.GetData(1)

                Set canonicalObj = $classmethod(context.ReportScheduleRun.SourceCanonicalClassName, "%OpenId", canonicalId, , .status)
                Quit:$$$ISERR(status)

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
            If canonicalId'=""
            {
                $$$LOGERROR("An error occurred when processing canonical ID "_canonicalId_" from class "_context.ReportScheduleRun.SourceCanonicalClassName_".")
                $$$LOGSTATUS(status)
            }

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

        Set status = reportObjectTree.%Save()
        
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
<if name='Cubes?' condition='context.ReportSchedule.Report.CubeList&apos;=""' xpos='200' ypos='1350' xend='200' yend='1600' >
<true>
<call name='Synchronize Cubes' target='Cube Operations' async='0' xpos='335' ypos='1500' >
<request type='Cube.BO.SynchronizeCubeListReq' >
<assign property="callrequest.CubeList" value="context.ReportSchedule.Report.CubeList" action="set" />
</request>
</call>
</true>
</if>

<faulthandlers>
<catchall name='Report Generation error' xpos='200' ypos='1250' xend='200' yend='1250' >
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
