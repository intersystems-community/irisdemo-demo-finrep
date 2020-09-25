/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/PSD007/v2/PSD007-Schema.xsd
Class FCA.PSD007.Submitter Extends (%Persistent, %XML.Adaptor) [ CompileAfter = FCA.PSD007.FRNType, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "urn:fsa-gov-uk:MER:PSD007:2";

Parameter XMLNAME = "Submitter";

Parameter XMLSEQUENCE = 1;

Property SubmittingFirm As FCA.PSD007.FRNType(XMLNAME = "SubmittingFirm") [ Required ];

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
<DataLocation>^FCA.PSD007.SubmitterD</DataLocation>
<DefaultData>SubmitterDefaultData</DefaultData>
<IdLocation>^FCA.PSD007.SubmitterD</IdLocation>
<IndexLocation>^FCA.PSD007.SubmitterI</IndexLocation>
<StreamLocation>^FCA.PSD007.SubmitterS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
