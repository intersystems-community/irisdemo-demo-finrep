/// A report can only be run if scheduled. The business service that we will use to trigger
/// reports is going to be expecting a ReportSchedule ID.
Class Report.ReportSchedule Extends %Persistent
{

Parameter DSTIME = "AUTO";

Property Report As ReportDef [ Required ];

Property DueDate As %Date [ Required ];

Property LastRun As ReportScheduleRun;

Property ScheduleStatus As %String(DISPLAYLIST = ",Scheduled,Overdue,Delivered", VALUELIST = ",1,2,3") [ InitialExpression = 1, Required ];

Property QueryParamList As list Of %String;

/// TODO:w
Method UpdateOverdueStatus()
{
    // good enough for the demo
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
<Value>ScheduleStatus</Value>
</Value>
<Value name="6">
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
