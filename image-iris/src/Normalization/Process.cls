Include Ensemble

/// 
Class Normalization.Process Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.RecordMap.Batch' response='Ens.Response' height='2200' width='2000' >
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
<property name='RecordIndex' type='%Integer' instantiate='0' />
<property name='RecordCount' type='%Integer' instantiate='0' />
<property name='Record' type='EnsLib.RecordMap.Base' instantiate='0' />
</context>
<sequence xend='200' yend='350' >
<while name='Try to normalize' condition='context.Action="Normalize"' xpos='200' ypos='250' xend='200' yend='1950' >
<scope xpos='200' ypos='250' xend='200' yend='1850' >
<assign name="Get Batch File Name" property="context.BatchFileName" value="request.%Source" action="set" xpos='200' ypos='350' />
<assign name="Open BatchJobSpec" property="context.BatchJobSpec" value="##class(Normalization.BatchJobSpec).BatchClassNameIndexOpen(request.%ClassName(1),,.status)" action="set" xpos='200' ypos='450' />
<assign name="Open or Create Batch" property="context.BatchControl" value="##class(Normalization.BatchControl).OpenOrCreate(request.%ClassName(1),context.BatchFileName,.status)" action="set" xpos='200' ypos='550' />
<assign name="New Batch Control Record" property="context.BatchControlRecord" value="##class(Normalization.BatchControlRecord).Create(context.BatchControl, process.%SessionId, context.BatchJobSpec, .status)" action="set" xpos='200' ypos='650' />

<call name='Synchronize BatchControlRecord cube' target='Cube Operations' async='0' xpos='335' ypos='1500' >
<request type='Cube.BO.SynchronizeCubeListReq' >
<assign property="callrequest.CubeList" value='"BatchControlRecord"' action="set" />
</request>
</call>

<assign name="Reset record count" property="context.RecordCount" value="0" action="set" xpos='200' ypos='750' />
<!--foreach name='Normalize each record...' property='request.Records' key='context.RecordIndex' xpos='200' ypos='850' xend='200' yend='450' >
<assign property="context.Record" value="request.Records.GetAt(context.RecordIndex)" action="set" xpos='200' ypos='250' /-->
<code name='Transform Record' xpos='200' ypos='350' >
<![CDATA[ 
                        
        Try
        {
            Set collectMetrics = 0

            If collectMetrics 
            {
                Set tForTimeStart=$Piece($ZTimeStamp,",",2) //DEL
            }

            Set oRS = context.BatchJobSpec.GetSQLCursorForBatch(request.%Id(), .status)
            Quit:$$$ISERR(status)

            If collectMetrics Set tNextRecordStart=$Piece($ZTimeStamp,",",2) //DEL

            While oRS.Next()
            {
                If collectMetrics Set tNextRecordEnd=$Piece($ZTimeStamp,",",2) //DEL
                Set ^normMetrics("NextRecord")=$Get(^normMetrics("NextRecord"))+(tNextRecordEnd-tNextRecordStart) //DEL
                

                If collectMetrics Set tGetRecordStart=$Piece($ZTimeStamp,",",2) //DEL

                Set context.Record = oRS.GetObject()

                If collectMetrics 
                {
                    Set tGetRecordEnd=$Piece($ZTimeStamp,",",2) //DEL
                    Set ^normMetrics("GetRecord")=$Get(^normMetrics("GetRecord"))+(tGetRecordEnd-tGetRecordStart) //DEL
                    If collectMetrics Set tDTLStart=$Piece($ZTimeStamp,",",2) //DEL
                }

                Set context.RecordCount=context.RecordCount+1

                
                Set status = $classmethod(context.BatchControlRecord.DTLClassName, "Transform", context.Record, .normalizedRecord)
                Quit:$$$ISERR(status)

                If collectMetrics 
                {
                    Set tDTLEnd=$Piece($ZTimeStamp,",",2) //DEL
                    Set ^normMetrics("DTL")=$Get(^normMetrics("DTL"))+(tDTLEnd-tDTLStart) //DEL 
                    Set tSaveStart=$Piece($ZTimeStamp,",",2) //DEL
                }

                Set normalizedRecord.%BatchControlRecord = context.BatchControlRecord 
                Set normalizedRecord.%OriginalBatchRecordId = context.Record.%Id()
                Set status = normalizedRecord.%Save() 
                Quit:$$$ISERR(status)

                If collectMetrics 
                {
                    Set tSaveEnd=$Piece($ZTimeStamp,",",2) //DEL
                    Set ^normMetrics("Save")=$Get(^normMetrics("Save"))+(tSaveEnd-tSaveStart) //DEL
                    Set tNextRecordStart=$Piece($ZTimeStamp,",",2) //DEL
                }
            }

            If collectMetrics 
            {
                Set tForTimeEnd=$Piece($ZTimeStamp,",",2) //DEL
                Set ^normMetrics("For")=tForTimeEnd-tForTimeStart 

                Set ^normMetrics("DTL%")        = (^normMetrics("DTL")/^normMetrics("For"))_"%" //DEL
                Set ^normMetrics("GetRecord%")  = (^normMetrics("GetRecord")/^normMetrics("For"))_"%" //DEL
                Set ^normMetrics("NextRecord%") = (^normMetrics("NextRecord")/^normMetrics("For"))_"%" //DEL
                Set ^normMetrics("Save%")       = (^normMetrics("Save")/^normMetrics("For"))_"%" //DEL

                Set ^normMetrics("DTLAvg")        = (^normMetrics("DTL")/context.RecordCount)_"s" //DEL
                Set ^normMetrics("GetRecordAvg")  = (^normMetrics("GetRecord")/context.RecordCount)_"s" //DEL
                Set ^normMetrics("NextRecordAvg") = (^normMetrics("NextRecord")/context.RecordCount)_"s" //DEL
                Set ^normMetrics("SaveAvg")       = (^normMetrics("Save")/context.RecordCount)_"s" //DEL
            }
        }
        Catch (oException)
        {
            Set status = oException.AsStatus()
        }

        If $$$ISERR(status)
        {
            $$$LOGERROR("An error occurred when processing record number " _ context.RecordCount_".")
            $$$LOGSTATUS(status)

            Do context.Record.XMLExportToString(.recordXML)
            $$$LOGERROR("Original Record: "_recordXML)

            If $IsObject(normalizedRecord)
            {
                Do normalizedRecord.XMLExportToString(.normalizedRecord)
                $$$LOGERROR("Normalized Record: "_normalizedRecord) 
            }

            Set status2 = context.BatchControlRecord.ChangeToErrorStatus($System.Status.GetErrorText(status), context.RecordCount)
            If $$$ISERR(status2) Set status = $System.Status.AppendStatus(status, status2)
        }

        
        
    ]]>
</code>
<!--/foreach-->
<trace name='Finished processing' value='"Finished processing the batch"' xpos='200' ypos='950' />
<assign name="Close Batch" property="status" value="context.BatchControlRecord.ChangeToAvailableStatus(context.RecordCount)" action="set" xpos='200' ypos='1050' />
<trace name='Batch closed' value='"Batch closed."' xpos='200' ypos='1150' />
<assign name="Done" property="context.Action" value="&quot;Done&quot;" action="set" xpos='200' ypos='1250' />
<if name='Cubes?' condition='context.BatchJobSpec.CubeList&apos;=""' xpos='200' ypos='1350' xend='200' yend='1600' >
<true>
<call name='Synchronize Cubes' target='Cube Operations' async='0' xpos='335' ypos='1500' >
<request type='Cube.BO.SynchronizeCubeListReq' >
<assign property="callrequest.CubeList" value="context.BatchJobSpec.CubeList" action="set" />
</request>
<response type='Ens.Response' />
</call>
</true>
</if>
<faulthandlers>
<catchall name='Normalization error' xpos='200' ypos='1700' xend='200' yend='1200' >
<trace name='Normalization problem' value='"Normalization problem"' xpos='200' ypos='250' />
<assign name="Compose Message" property="context.Message" value="&quot;The following problem occurred when trying to process session &quot;_process.%SessionId_&quot;: &quot;_$System.Status.GetOneStatusText(..%Context.%LastError)" action="set" xpos='200' ypos='350' />
<alert value='context.Message' xpos='200' ypos='450' />
<call name='New Workflow Task' target='Data Stewards' async='1' xpos='200' ypos='550' >
<annotation><![CDATA[
                                Human Intervention Required
                                Sending request to a Data Steward 
                                ]]></annotation>
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
<assign name="Close Batch" property="status" value="context.BatchControlRecord.ChangeToDiscardedStatus()" action="set" xpos='200' ypos='1000' />
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
