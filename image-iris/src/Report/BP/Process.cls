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
<property name='Report' type='EnsLib.EDI.XML.Document' instantiate='0' />
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

            //Set status = context.ReportScheduleRun.GetResultSet(.oRS)
            //Quit:$$$ISERR(status)

            Set status = $classmethod(context.ReportScheduleRun.HeaderDTL, "Transform", context.ReportScheduleRun, .report)
            Quit:$$$ISERR(status)

            
            Set status = $classmethod("Custom.FCAReport.DTL.PSD001.FSAHSFFeedMGMsg", "Transform", context.ReportScheduleRun, .report, 1)
            Quit:$$$ISERR(status)

            Set status = $classmethod("Custom.FCAReport.DTL.PSD001.FSAHSFFeedMGMsg", "Transform", context.ReportScheduleRun, .report, 2)
            Quit:$$$ISERR(status)

            /*
            While oRS.Next()
            {
                Set canonicalId = oRS.GetData(1)

                Set canonicalObj = $classmethod(context.ReportScheduleRun.SourceCanonicalClassName, "%OpenId", canonicalId, , .status)
                Quit:$$$ISERR(status)

                Set context.RecordCount=context.RecordCount+1

                Set status = $classmethod(context.ReportScheduleRun.ContentsDTL, "Transform", canonicalObj, .report) 
                Quit:$$$ISERR(status)
            }
            Quit:$$$ISERR(status)
            */
        }
        Catch (oException)
        {
            Set status = oException.AsStatus()
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
            
        }
        Else
        {
            Set status = report.%Save()
        
            If $$$ISERR(status)
            {
                $$$LOGERROR("An error occurred when trying to save the final report.")
                $$$LOGSTATUS(status)

                Set status2 = context.ReportScheduleRun.ChangeToErrorStatus($System.Status.GetErrorText(status), context.RecordCount)
                If $$$ISERR(status2) Set status = $System.Status.AppendStatus(status, status2)
            }
            Else
            {
                Set context.Report=report
            }
        }
        
    ]]>
</code>
<trace name='Finished processing' value='"Finished processing the report"' xpos='200' ypos='750' />
<assign name="Close Report" property="status" value="context.ReportScheduleRun.ChangeToGeneratedStatus(context.RecordCount)" action="set" xpos='200' ypos='850' />
<trace name='Batch closed' value='"Batch closed."' xpos='200' ypos='950' />
<assign name="Done" property="context.Action" value="&quot;Done&quot;" action="set" xpos='200' ypos='1050' />
<call name='Send to Trace' target='Trace Operation' async='0' xpos='200' ypos='1150' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="context.Report" action="set" />
</request>
<response type='Ens.Response' />
</call>
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
