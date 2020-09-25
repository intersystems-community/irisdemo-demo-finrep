/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/CommonTypes/v10/CommonTypes-Schema.xsd
Class FCA.PSD007.Submitter1 Extends (%Persistent, %XML.Adaptor) [ CompileAfter = FCA.PSD007.FRNType, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "urn:fsa-gov-uk:MER:PSD007:2";

Parameter XMLNAME = "Submitter";

Parameter XMLSEQUENCE = 1;

Parameter XMLTYPE = "Submitter";

/// The FRN code of the firm submitting the report.
Property SubmittingFirm As FCA.PSD007.FRNType(XMLNAME = "SubmittingFirm") [ Required ];

Storage Default
{
<Data name="Submitter1DefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SubmittingFirm</Value>
</Value>
</Data>
<DataLocation>^FCA.PSD007.Submitter1D</DataLocation>
<DefaultData>Submitter1DefaultData</DefaultData>
<IdLocation>^FCA.PSD007.Submitter1D</IdLocation>
<IndexLocation>^FCA.PSD007.Submitter1I</IndexLocation>
<StreamLocation>^FCA.PSD007.Submitter1S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
