Class Report.ReportRun Extends %Persistent
{

Property Property As ReportDef [ Required ];

Property ReportRunDate As %TimeStamp [ InitialExpression = {$ZDateTime($ZTimeStamp,3)}, Required ];

Property NumberOfRowsReported As %BigInt;

Storage Default
{
<Data name="ReportRunDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Property</Value>
</Value>
<Value name="3">
<Value>ReportRunDate</Value>
</Value>
<Value name="4">
<Value>NumberOfRowsReported</Value>
</Value>
</Data>
<DataLocation>^Report.ReportRunD</DataLocation>
<DefaultData>ReportRunDefaultData</DefaultData>
<IdLocation>^Report.ReportRunD</IdLocation>
<IndexLocation>^Report.ReportRunI</IndexLocation>
<StreamLocation>^Report.ReportRunS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
