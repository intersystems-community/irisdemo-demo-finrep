Class Report.ReportDef Extends %Persistent
{

Property ReportName As %String [ Required ];

Property ReportQuery As %String(MAXLEN = "") [ Required ];

Storage Default
{
<Data name="ReportDefDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ReportName</Value>
</Value>
<Value name="3">
<Value>ReportQuery</Value>
</Value>
</Data>
<DataLocation>^Report.ReportDefD</DataLocation>
<DefaultData>ReportDefDefaultData</DefaultData>
<IdLocation>^Report.ReportDefD</IdLocation>
<IndexLocation>^Report.ReportDefI</IndexLocation>
<StreamLocation>^Report.ReportDefS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
