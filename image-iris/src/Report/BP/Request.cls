Class Report.BP.Request Extends (%Persistent, %XML.Adaptor)
{

Property ReportScheduleId As %String [ Required ];

Storage Default
{
<Data name="RequestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ReportScheduleId</Value>
</Value>
</Data>
<DataLocation>^Report.BP.RequestD</DataLocation>
<DefaultData>RequestDefaultData</DefaultData>
<IdLocation>^Report.BP.RequestD</IdLocation>
<IndexLocation>^Report.BP.RequestI</IndexLocation>
<StreamLocation>^Report.BP.RequestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
