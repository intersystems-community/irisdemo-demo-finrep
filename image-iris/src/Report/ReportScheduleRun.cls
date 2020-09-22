Class Report.ReportScheduleRun Extends %Persistent
{

Property ReportSchedule As ReportSchedule [ Required ];

Property ReportRunDate As %TimeStamp [ InitialExpression = {$ZDateTime($ZTimeStamp,3)}, Required ];

Property LastStatusChange As %TimeStamp [ InitialExpression = {$ZDateTime($ZTimeStamp,3)}, Required ];

Property NumOfRecordsReported As %BigInt;

Property SessionId As %String;

Property RunStatus As %String(DISPLAYLIST = ",Pending,Error,Replaced,Generated,Discarded,Pending Cancelation,Cancelled", VALUELIST = ",1,2,3,4,5,6,7") [ InitialExpression = 1, Required ];

Property Reason As %String(MAXLEN = 32000);

Property ReportQuery As %String(MAXLEN = "") [ Required ];

Property SourceCanonicalClassName As %String [ Required ];

Property HeaderDTL As %String [ Required ];

Property ContentsDTL As %String [ Required ];

ClassMethod Create(pReportSchedule As Report.ReportSchedule, pSessionId As %String, Output pStatus As %Status) As Report.ReportScheduleRun
{
    Set pStatus = $$$OK
    Set oReportScheduleRun = ""
    Try 
    {
        Set oReportScheduleRun = ..%New()
        Set oReportScheduleRun.ReportSchedule = pReportSchedule
        Set oReportScheduleRun.SessionId = pSessionId
        Set oReportScheduleRun.ReportQuery = pReportSchedule.Report.ReportQuery
        Set oReportScheduleRun.SourceCanonicalClassName = pReportSchedule.Report.SourceCanonicalClassName
        Set oReportScheduleRun.HeaderDTL = pReportSchedule.Report.HeaderDTL
        Set oReportScheduleRun.ContentsDTL = pReportSchedule.Report.ContentsDTL

        Set pStatus = oReportScheduleRun.%Save()
    } 
    Catch (oException)
    {
        Set pStatus = oException.AsStatus()
    }
    
    Quit oReportScheduleRun
}

Method GetResultSet(Output pRS As %Library.ResultSet) As %Status
{
    Set tSC = $$$OK
    Try 
    {
        Set args=..ReportSchedule.QueryParamList.Count()
        For i=1:1:args
        {
            Set args(i)=..ReportSchedule.QueryParamList.GetAt(i)
        }

        Set pRS = ##class(%ResultSet).%New()
        Set tSC = pRS.Prepare(..ReportQuery)
        Quit:$$$ISERR(tSC)

        Set tSC = pRS.Execute(args...)

    } 
    Catch (oException)
    {
        Set tSC = oException.AsStatus()
    }
    
    Quit tSC
}

Method ChangeToErrorStatus(pReason As %String, pNumOfRecordsReported As %Integer = 0) As %Status
{
    Set tSC = $$$OK

    Try 
    {
        TStart 

        Set ..RunStatus=2 //Error
        Set ..NumOfRecordsReported=pNumOfRecordsReported
        Set ..ReportSchedule.LastRun=$this
        Do ..ReportSchedule.UpdateOverdueStatus()

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

        Set ..RunStatus=3 //Replaced

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

Method ChangeToGeneratedStatus(pNumOfRecordsReported As %Integer = 0) As %Status
{
    Set tSC = $$$OK

    Try 
    {
        TStart 

        If ..ReportSchedule.LastRun'=""
        {
            Set tSC = ..ReportSchedule.LastRun.ChangeToReplacedStatus()
            Quit:$$$ISERR(tSC)
        }

        Set ..RunStatus=4 //Generated
        Set ..LastStatusChange = $ZDateTime($ZTimeStamp,3)
        Set ..NumOfRecordsReported=pNumOfRecordsReported

        Set ..ReportSchedule.LastRun=$this
        Do ..ReportSchedule.UpdateOverdueStatus()
        
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

        Set ..RunStatus=5 //Discarded
        
        Set ..LastStatusChange = $ZDateTime($ZTimeStamp,3)
        Set ..NumOfRecordsReported=pNumOfRecordsReported

        Set ..ReportSchedule.LastRun=$this
        Do ..ReportSchedule.UpdateOverdueStatus()

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
<Data name="ReportScheduleRunDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ReportSchedule</Value>
</Value>
<Value name="3">
<Value>ReportRunDate</Value>
</Value>
<Value name="4">
<Value>LastStatusChange</Value>
</Value>
<Value name="5">
<Value>NumOfRecordsReported</Value>
</Value>
<Value name="6">
<Value>SessionId</Value>
</Value>
<Value name="7">
<Value>RunStatus</Value>
</Value>
<Value name="8">
<Value>Reason</Value>
</Value>
<Value name="9">
<Value>ReportQuery</Value>
</Value>
<Value name="10">
<Value>SourceCanonicalClassName</Value>
</Value>
<Value name="11">
<Value>HeaderDTL</Value>
</Value>
<Value name="12">
<Value>ContentsDTL</Value>
</Value>
</Data>
<DataLocation>^Report.ReportScheduleRunD</DataLocation>
<DefaultData>ReportScheduleRunDefaultData</DefaultData>
<IdLocation>^Report.ReportScheduleRunD</IdLocation>
<IndexLocation>^Report.ReportScheduleRunI</IndexLocation>
<StreamLocation>^Report.ReportScheduleRunS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
