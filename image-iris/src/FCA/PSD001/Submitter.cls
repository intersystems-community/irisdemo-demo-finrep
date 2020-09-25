/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/CommonTypes/v10/CommonTypes-Schema.xsd
Class FCA.PSD001.Submitter Extends (%Persistent, %XML.Adaptor) [ CompileAfter = FCA.PSD001.FRNType, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAHSFFeedMG-v2";

Parameter XMLNAME = "Submitter";

Parameter XMLSEQUENCE = 1;

/// The FRN code of the firm submitting the report.
Property SubmittingFirm As FCA.PSD001.FRNType(XMLNAME = "SubmittingFirm") [ Required ];

Storage Default
{
<Data name="SubmitterDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SubmittingFirm</Value>
</Value>
</Data>
<DataLocation>^FCA.PSD001.SubmitterD</DataLocation>
<DefaultData>SubmitterDefaultData</DefaultData>
<IdLocation>^FCA.PSD001.SubmitterD</IdLocation>
<IndexLocation>^FCA.PSD001.SubmitterI</IndexLocation>
<StreamLocation>^FCA.PSD001.SubmitterS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
