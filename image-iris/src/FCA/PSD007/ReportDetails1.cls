/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/CommonTypes/v10/CommonTypes-Schema.xsd
Class FCA.PSD007.ReportDetails1 Extends (%Persistent, %XML.Adaptor) [ CompileAfter = FCA.PSD007.NonEmptyString, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "urn:fsa-gov-uk:MER:PSD007:2";

Parameter XMLNAME = "ReportDetails";

Parameter XMLSEQUENCE = 1;

Parameter XMLTYPE = "ReportDetails";

/// Report creation date.
Property ReportCreationDate As %Date(XMLNAME = "ReportCreationDate") [ Required ];

/// Unique identifier for the report (wthin the context of the submitter, submitting firm, submitting department and report creation date).
Property ReportIdentifier As FCA.PSD007.NonEmptyString(MAXLEN = 25, XMLNAME = "ReportIdentifier") [ Required ];

Storage Default
{
<Data name="ReportDetails1DefaultData">
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
<DataLocation>^FCA.PSD007.ReportDetails1D</DataLocation>
<DefaultData>ReportDetails1DefaultData</DefaultData>
<IdLocation>^FCA.PSD007.ReportDetails1D</IdLocation>
<IndexLocation>^FCA.PSD007.ReportDetails1I</IndexLocation>
<StreamLocation>^FCA.PSD007.ReportDetails1S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
