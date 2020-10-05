Class Normalization.BatchControlRecord Extends (%Persistent, %XML.Adaptor)
{

Parameter DSTIME = "AUTO";

Property BatchControl As Normalization.BatchControl [ Required ];

Property CreationDate As %TimeStamp [ InitialExpression = {$ZDateTime($ZTimeStamp,3)}, Required ];

Property SessionId As %String [ Required ];

Property DTLClassName As %String(MAXLEN = 256) [ Required ];

Property CanonicalClassName As %String(MAXLEN = 256) [ Required ];

Property ProcessingStatus As %String(DISPLAYLIST = ",Processing,Error,Discarded,Available,Replaced", VALUELIST = ",1,2,3,7,9") [ InitialExpression = 1, Required ];

Property LastStatusChange As %TimeStamp [ InitialExpression = {$ZDateTime($ZTimeStamp,3)}, Required ];

Property BatchRecordClassName As %String(MAXLEN = 250) [ Required ];

Property NumberOfRecordsProcessed As %Integer;

Property Reason As %String(MAXLEN = "");

Property IsLatest As %Boolean [ Calculated, SqlComputeCode = { 
    
    Set me = {ID}
    &SQL(select t.BatchControl->LastControlRecord into :lastControlRecordId from Normalization.BatchControlRecord t where t.ID = :me)
    Set {IsLatest} = ({ID}=lastControlRecordId)
    
    }, SqlComputed ];

Index BatchControlIndex On BatchControl;

ClassMethod Create(pBatchControl As Normalization.BatchControl, pSessionId As %String, pJobSpec As Normalization.BatchJobSpec, Output pStatus As %Status) As Normalization.BatchControlRecord
{
    Set pStatus = $$$OK
    Set oNewBatchControlRecord = ""
    Try 
    {
        Set oNewBatchControlRecord = ..%New()
        Set oNewBatchControlRecord.BatchControl = pBatchControl
        Set oNewBatchControlRecord.SessionId = pSessionId
        Set oNewBatchControlRecord.DTLClassName = pJobSpec.DTLClassName
        Set oNewBatchControlRecord.CanonicalClassName = pJobSpec.CanonicalClassName
        Set oNewBatchControlRecord.BatchRecordClassName = pJobSpec.BatchRecordClassName

        If pBatchControl.LastControlRecord=""
        {
            Set pBatchControl.LastControlRecord=oNewBatchControlRecord
        }
    } 
    Catch (oException)
    {
        Set pStatus = oException.AsStatus()
    }
    
    Quit oNewBatchControlRecord
}

Method ChangeToErrorStatus(pReason As %String, pNumberOfRecordsProcessed As %Integer = 0) As %Status
{
    Set tSC = $$$OK

    Try 
    {
        TStart 

        Set ..ProcessingStatus=2 //Error
        Set ..BatchControl.LastProcessingStatus=..ProcessingStatus
        Set ..NumberOfRecordsProcessed=pNumberOfRecordsProcessed

        Set tSC = $ClassMethod(..CanonicalClassName, "ChangeBatchRecordStatus", ..%Id(), ..ProcessingStatus)
        Quit:$$$ISERR(tSC)

        Set ..LastStatusChange = $ZDateTime($ZTimeStamp,3)
        Set ..Reason = pReason

        Set tSC = ..%Save()
        Quit:$$$ISERR(tSC)

        TCommit
    } 
    Catch (oException)
    {
        Set tSC = oException.AsStatus()
    }
    
    If $$$ISERR(tSC)
    {
        TRollback
    }

    Quit tSC
}

Method ChangeToReplacedStatus() As %Status
{
    Set tSC = $$$OK

    Try 
    {
        TStart 

        Set ..ProcessingStatus=9 //Replaced

        Set tSC = $ClassMethod(..CanonicalClassName, "ChangeBatchRecordStatus", ..%Id(), ..ProcessingStatus)
        Quit:$$$ISERR(tSC)

        Set ..LastStatusChange = $ZDateTime($ZTimeStamp,3)

        Set tSC = ..%Save()
        Quit:$$$ISERR(tSC)

        TCommit
    } 
    Catch (oException)
    {
        Set tSC = oException.AsStatus()
    }
    
    If $$$ISERR(tSC)
    {
        TRollback
    }

    Quit tSC
}

Method ChangeToAvailableStatus(pNumberOfRecordsProcessed As %Integer = 0) As %Status
{
    Set tSC = $$$OK

    Try 
    {
        TStart 

        If ..BatchControl.LastControlRecord'=""
        {
            Set tSC = ..BatchControl.LastControlRecord.ChangeToReplacedStatus()
            Quit:$$$ISERR(tSC)
        }

        Set ..ProcessingStatus=7 //Available
        Set ..LastStatusChange = $ZDateTime($ZTimeStamp,3)
        Set ..NumberOfRecordsProcessed=pNumberOfRecordsProcessed

        Set ..BatchControl.LastProcessingStatus=..ProcessingStatus
        Set ..BatchControl.LastControlRecord=$this
        
        Set tSC = $ClassMethod(..CanonicalClassName, "ChangeBatchRecordStatus", ..%Id(), ..ProcessingStatus)
        Quit:$$$ISERR(tSC)

        Set tSC = ..%Save()
        Quit:$$$ISERR(tSC)

        TCommit
    } 
    Catch (oException)
    {
        Set tSC = oException.AsStatus()
    }
    
    If $$$ISERR(tSC)
    {
        TRollback
    }

    Quit tSC
}

Method ChangeToDiscardedStatus() As %Status
{
    Set tSC = $$$OK

    Try 
    {
        TStart 

        Set ..ProcessingStatus=3 //Discarded
        Set ..BatchControl.LastProcessingStatus=..ProcessingStatus

        Set tSC = $ClassMethod(..CanonicalClassName, "ChangeBatchRecordStatus", ..%Id(), ..ProcessingStatus)
        Quit:$$$ISERR(tSC)

        Set ..LastStatusChange = $ZDateTime($ZTimeStamp,3)

        Set tSC = ..%Save()
        Quit:$$$ISERR(tSC)

        TCommit
    } 
    Catch (oException)
    {
        Set tSC = oException.AsStatus()
    }
    
    If $$$ISERR(tSC)
    {
        TRollback
    }

    Quit tSC
}

Storage Default
{
<Data name="BatchControlRecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>BatchControl</Value>
</Value>
<Value name="3">
<Value>CreationDate</Value>
</Value>
<Value name="4">
<Value>SessionId</Value>
</Value>
<Value name="5">
<Value>DTLClassName</Value>
</Value>
<Value name="6">
<Value>ProcessingStatus</Value>
</Value>
<Value name="7">
<Value>LastStatusChange</Value>
</Value>
<Value name="8">
<Value>RequiredHumanWF</Value>
</Value>
<Value name="9">
<Value>Reason</Value>
</Value>
<Value name="10">
<Value>CanonicalClassName</Value>
</Value>
<Value name="11">
<Value>BatchRecordClassName</Value>
</Value>
<Value name="12">
<Value>NumberOfRecordsProcessed</Value>
</Value>
</Data>
<DataLocation>^Normalization.BatchControA09AD</DataLocation>
<DefaultData>BatchControlRecordDefaultData</DefaultData>
<IdLocation>^Normalization.BatchControA09AD</IdLocation>
<IndexLocation>^Normalization.BatchControA09AI</IndexLocation>
<StreamLocation>^Normalization.BatchControA09AS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
