Include Ensemble

/// 
Class Normalization.Process Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.RecordMap.Batch' response='Ens.Response' height='2000' width='2000' >
    <context>
        <property name='BatchJobSpec' type='Normalization.BatchJobSpec' instantiate='0' />
        <property name='BatchControl' type='Normalization.BatchControl' instantiate='0' />
        <property name='BatchControlRecord' type='Normalization.BatchControlRecord' instantiate='0' />

        <property name='Action' type='%String' initialexpression='"Normalize"' instantiate='0' >
            <parameters>
                <parameter name='MAXLEN'  value='50' />
            </parameters>
        </property>
        <property name='Message' type='%String' instantiate='0' >
            <parameters>
                <parameter name='MAXLEN'  value='2500' />
            </parameters>
        </property>
        <property name='BatchFileName' type='%String' instantiate='0' >
            <parameters>
                <parameter name='MAXLEN'  value='32000' />
            </parameters>
        </property>

        <property name='RecordIndex' type='%Integer'/>
        <property name='RecordCount' type='%Integer'/>
        <property name='Record' type='EnsLib.RecordMap.Base' instantiate='0'/>
        
    </context>
    
    <sequence xend='200' yend='700' >

        <while name='Try to normalize' condition='context.Action="Normalize"' xpos='470' ypos='400' xend='200' yend='800' >

            <scope xpos='200' ypos='250' xend='200' yend='700' >

                <assign name="Get Batch File Name" property="context.BatchFileName" value='request.%Source' action="set" xpos='200' ypos='450' />

                <assign name="Open BatchJobSpec" property="context.BatchJobSpec" value='##class(Normalization.BatchJobSpec).BatchClassNameIndexOpen(request.%ClassName(1),,.status)' action="set" xpos='200' ypos='450' />

                <assign name="Open or Create Batch" property="context.BatchControl" value='##class(Normalization.BatchControl).OpenOrCreate(request.%ClassName(1),context.BatchFileName,.status)' action="set" xpos='200' ypos='450' />

                <assign name="New Batch Control Record" property="context.BatchControlRecord" value='##class(Normalization.BatchControlRecord).Create(context.BatchControl, process.%SessionId, context.BatchJobSpec, .status)' action="set" xpos='200' ypos='450' />    

                <foreach property="request.Records" key="context.RecordIndex">
                    <assign property="context.Record" value="request.Records.GetAt(context.RecordIndex)"/>

                    <code name='Transform Record' xpos='200' ypos='350' >
                    <![CDATA[ 
                        
                        Set status = $classmethod(context.BatchControlRecord.DTLClassName, "Transform", context.Record, .normalizedRecord)

                        Set normalizedRecord.%BatchControlRecord = context.BatchControlRecord 
                        Set normalizedRecord.%OriginalBatchRecordId = context.Record.%Id()

                        Set status = normalizedRecord.%Save()
                        If $$$ISERR(status) 
                        {
                            $$$LOGSTATUS(status)

                            Do context.Record.XMLExportToString(.recordXML)
                            $$$LOGERROR("Original Record: "_recordXML)

                            Do normalizedRecord.XMLExportToString(.normalizedRecordXML)
                            $$$LOGERROR("Normalized Record: "_normalizedRecordXML)

                            Set status2 = context.BatchControlRecord.ChangeToErrorStatus($System.Status.GetErrorText(status), context.RecordCount)
                            If $$$ISERR(status2) Set status = $System.Status.AppendStatus(status, status2)
                        }

                        Set context.RecordCount=context.RecordCount+1
                        
                    ]]>
                    </code>
                </foreach>

                <assign name='Close Batch' property='status' value='context.BatchControlRecord.ChangeToAvailableStatus(context.RecordCount)'/>

                <assign name="Done" property="context.Action" value="&quot;Done&quot;" action="set" xpos='200' ypos='450' />

                <faulthandlers>
                    <catchall name='Normalization error' xpos='200' ypos='550' xend='200' yend='1200' >
                        <trace name='Normalization problem' value='"Normalization problem"' xpos='200' ypos='250' />

                        <assign name="Compose Message" property="context.Message" value="&quot;The following problem occurred when trying to process session &quot;_process.%SessionId_&quot;: &quot;_$System.Status.GetOneStatusText(..%Context.%LastError)" action="set" xpos='200' ypos='350' />

                        <alert value='context.Message' xpos='200' ypos='450' />

                        <call name='New Workflow Task' target='Data Stewards' async='1' xpos='200' ypos='550' >
                            <annotation>
                                <![CDATA[
                                Human Intervention Required
                                Sending request to a Data Steward
                                ]]>
                            </annotation>
                            <request type='EnsLib.Workflow.TaskRequest' >
                                <assign property="callrequest.%Actions" value="&quot;Retry,Discard&quot;" action="set" />
                                <assign property="callrequest.%Subject" value="&quot;Normalization Problem&quot;" action="set" />
                                <assign property="callrequest.%Message" value="context.Message" action="set" />
                            </request>
                            <response type='EnsLib.Workflow.TaskResponse' >
                                <assign property="context.Action" value="callresponse.%Action" action="set" />
                            </response>
                        </call>
                        
                        <sync name='Wait for human intervention' calls='New Workflow Task' type='all' xpos='200' ypos='650' />

                        <if name='Retry?' condition='context.Action="Retry"' xpos='200' ypos='750' xend='200' yend='1100' >
                        <true>
                            <trace name='Specialist asked to retry' value='"Specialist asked to retry"' xpos='470' ypos='900' />
                            <assign name="Retry normalization" property="context.Action" value="&quot;Normalize&quot;" action="set" xpos='470' ypos='1000' />
                        </true>
                        <false>
                            <trace name='Specialist asked to discard' value='"Specialist asked to discard"' xpos='200' ypos='900' />
                            <assign name='Close Batch' property='status' value='context.BatchControlRecord.ChangeToDiscardedStatus()'/>
                        </false>
                        </if>
                    </catchall>
                </faulthandlers>
            </scope>
        </while>

        <call name='Trace' target='Trace Operation' async='1' xpos='200' ypos='600' >
            <request type='Normalization.BatchControlRecord' >
                <assign property="callrequest" value="context.BatchControlRecord" action="set" />
            </request>
        </call>

    </sequence>
</process>
}

/// BPL Definition

}
