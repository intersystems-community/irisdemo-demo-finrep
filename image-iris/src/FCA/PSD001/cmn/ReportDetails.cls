/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/PSD-CommonTypes/v1.2/FSAFeedCommon-v1-2.xsd
Class FCA.PSD001.cmn.ReportDetails Extends (%Persistent, %XML.Adaptor) [ CompileAfter = FCA.PSD001.cmn.NonEmptyString, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAFeedCommon-v1-2";

Parameter XMLNAME = "ReportDetails";

Parameter XMLSEQUENCE = 1;

/// Report creation date.
Property ReportCreationDate As %Date(XMLNAME = "ReportCreationDate") [ Required ];

/// Unique identifier for the report (wthin the context of the submitter, submitting firm, submitting department and report creation date).
Property ReportIdentifier As FCA.PSD001.cmn.NonEmptyString(MAXLEN = 25, XMLNAME = "ReportIdentifier") [ Required ];

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
<DataLocation>^FCA.PSD001.cmn.ReportDetailsD</DataLocation>
<DefaultData>ReportDetailsDefaultData</DefaultData>
<IdLocation>^FCA.PSD001.cmn.ReportDetailsD</IdLocation>
<IndexLocation>^FCA.PSD001.cmn.ReportDetailsI</IndexLocation>
<StreamLocation>^FCA.PSD001.cmn.ReportDetailsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
