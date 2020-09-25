/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/PSD007/v2/PSD007-Schema.xsd
Class FCA.PSD007.ReportDetails Extends (%Persistent, %XML.Adaptor) [ CompileAfter = FCA.PSD007.String100Type, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "urn:fsa-gov-uk:MER:PSD007:2";

Parameter XMLNAME = "ReportDetails";

Parameter XMLSEQUENCE = 1;

Property ReportCreationDate As %Date(XMLNAME = "ReportCreationDate") [ Required ];

Property ReportIdentifier As FCA.PSD007.String100Type(XMLNAME = "ReportIdentifier") [ Required ];

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
<DataLocation>^FCA.PSD007.ReportDetailsD</DataLocation>
<DefaultData>ReportDetailsDefaultData</DefaultData>
<IdLocation>^FCA.PSD007.ReportDetailsD</IdLocation>
<IndexLocation>^FCA.PSD007.ReportDetailsI</IndexLocation>
<StreamLocation>^FCA.PSD007.ReportDetailsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
