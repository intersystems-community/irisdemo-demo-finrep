/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/PSD-CommonTypes/v1.2/FSAFeedCommon-v1-2.xsd
Class FCA.PSD001.cmn.Submitter Extends (%Persistent, %XML.Adaptor) [ CompileAfter = (FCA.PSD001.cmn.FSARefType, FCA.PSD001.cmn.NonEmptyString), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAFeedCommon-v1-2";

Parameter XMLNAME = "Submitter";

Parameter XMLSEQUENCE = 1;

/// The FSA code of the firm submitting the report.
Property SubmittingFirm As FCA.PSD001.cmn.FSARefType(XMLNAME = "SubmittingFirm") [ Required ];

/// The identifier of the department within the submitting firm who created this report - optional.
Property SubmittingDept As FCA.PSD001.cmn.NonEmptyString(MAXLEN = 20, XMLNAME = "SubmittingDept", XMLPATTERN = "[a-zA-Z0-9]+");

Storage Default
{
<Data name="SubmitterDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SubmittingFirm</Value>
</Value>
<Value name="3">
<Value>SubmittingDept</Value>
</Value>
</Data>
<DataLocation>^FCA.PSD001.cmn.SubmitterD</DataLocation>
<DefaultData>SubmitterDefaultData</DefaultData>
<IdLocation>^FCA.PSD001.cmn.SubmitterD</IdLocation>
<IndexLocation>^FCA.PSD001.cmn.SubmitterI</IndexLocation>
<StreamLocation>^FCA.PSD001.cmn.SubmitterS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
