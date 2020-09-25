/// A report can only be run if scheduled. The business service that we will use to trigger
/// reports is going to be expecting a ReportSchedule ID.
Class Report.ReportSchedule Extends (%Persistent, %XML.Adaptor)
{

Parameter DSTIME = "AUTO";

Property Report As ReportDef(XMLPROJECTION = "NONE") [ Required ];

Property DueDate As %Date [ Required ];

Property LastRun As ReportScheduleRun(XMLPROJECTION = "NONE");

Property QueryParamList As list Of %String;

Property ScheduleStatus As %String(DISPLAYLIST = ",Scheduled,Overdue,Delivered", VALUELIST = ",1,2,3") [ Calculated, SqlComputeCode = { 
    Set {*}=##class(Report.ReportSchedule).ComputeScheduleStatus({ID},{DueDate},{LastRun}) 
    }, SqlComputed ];

ClassMethod ComputeScheduleStatus(pReportScheduleId As %Integer, pDueDate As %Date, pLastRun As ReportScheduleRun) As %Integer
{
    If pDueDate>+$H Return 1 //Scheduled
    
    If pLastRun="" Return 2 // Overdue

    &SQL(select LastRun->RunStatus into :lastRunStatus from Report.ReportSchedule where ID = :pReportScheduleId)

    // 1-Pending,2-Error,3-Replaced,4-Generated,5-Discarded,6-Pending Cancelation,7-Cancelled
    If ",1,2,3,5,6,7,"[(","_lastRunStatus_",")
    {
        Return 2 // Overdue
    }
    
    // lastRunStatus = 4 - Generated
    Return 3 // Delivered
}

Storage Default
{
<Data name="ReportScheduleDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Report</Value>
</Value>
<Value name="3">
<Value>DueDate</Value>
</Value>
<Value name="4">
<Value>LastRun</Value>
</Value>
<Value name="5">
<Value>QueryParamList</Value>
</Value>
</Data>
<DataLocation>^Report.ReportScheduleD</DataLocation>
<DefaultData>ReportScheduleDefaultData</DefaultData>
<IdLocation>^Report.ReportScheduleD</IdLocation>
<IndexLocation>^Report.ReportScheduleI</IndexLocation>
<StreamLocation>^Report.ReportScheduleS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
