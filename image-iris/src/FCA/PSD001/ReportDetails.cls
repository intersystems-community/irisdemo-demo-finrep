/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/CommonTypes/v10/CommonTypes-Schema.xsd
Class FCA.PSD001.ReportDetails Extends (%Persistent, %XML.Adaptor) [ CompileAfter = FCA.PSD001.NonEmptyString, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAHSFFeedMG-v2";

Parameter XMLNAME = "ReportDetails";

Parameter XMLSEQUENCE = 1;

/// Report creation date.
Property ReportCreationDate As %Date(XMLNAME = "ReportCreationDate") [ Required ];

/// Unique identifier for the report (wthin the context of the submitter, submitting firm, submitting department and report creation date).
Property ReportIdentifier As FCA.PSD001.NonEmptyString(MAXLEN = 25, XMLNAME = "ReportIdentifier") [ Required ];

Storage Default
{
<Data name="ReportDetailsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ReportCreationDate</Value>
</Value>
<Value name="3">
<Value>ReportIdentifier</Value>
</Value>
</Data>
<DataLocation>^FCA.PSD001.ReportDetailsD</DataLocation>
<DefaultData>ReportDetailsDefaultData</DefaultData>
<IdLocation>^FCA.PSD001.ReportDetailsD</IdLocation>
<IndexLocation>^FCA.PSD001.ReportDetailsI</IndexLocation>
<StreamLocation>^FCA.PSD001.ReportDetailsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
