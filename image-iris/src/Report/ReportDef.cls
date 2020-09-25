/// This is a Report Definition. A report can not be run without a schedule.
/// The report definition defines its name, query to be run and DTLs to apply to the query
/// returned data. The query will normally have parameters. These are to be specified on the 
/// ReportSchedule and should vary from schedule to schedule. 
Class Report.ReportDef Extends (%Persistent, %XML.Adaptor)
{

Property ReportName As %String [ Required ];

Property ReportCode As %String [ Required ];

/// Fetches a list of IDs from SourceCanonicalClassName that must be incorportated into this report
/// The parameters for the query will be coming from the ReportSchedule object.
Property ReportQuery As %String(MAXLEN = "") [ Required ];

/// The ReportQuery SQL statement must return IDs of this class
Property SourceCanonicalClassName As %String [ Required ];

/// Transformation that will be called once to transform an instance of 
/// ReportScheduleRun to a <PSDFeedHeader> in the final FCA document
Property HeaderDTL As %String [ Required ];

/// Transformation that will be called for each record returned by ReportQuery to
/// transform it and add it to the generated FCA document
Property ContentsDTL As %String [ Required ];

Property ReportClassName As %String [ Required ];

/// List of cubes that need to be synchronized after a report is succesfully generated
Property CubeList As %String(MAXLEN = 32000) [ Required ];

Index ReportCodeIndex On ReportCode [ Unique ];

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
<Value>ReportCode</Value>
</Value>
<Value name="4">
<Value>ReportQuery</Value>
</Value>
<Value name="5">
<Value>SourceCanonicalClassName</Value>
</Value>
<Value name="6">
<Value>HeaderDTL</Value>
</Value>
<Value name="7">
<Value>ContentsDTL</Value>
</Value>
<Value name="8">
<Value>ReportClassName</Value>
</Value>
<Value name="9">
<Value>CubeList</Value>
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
