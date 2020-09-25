/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/PSD007/v2/PSD007-Schema.xsd
Class FCA.PSD007.PSDFeedHeader Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "urn:fsa-gov-uk:MER:PSD007:2";

Parameter XMLNAME = "PSDFeedHeader";

Parameter XMLSEQUENCE = 1;

Property Submitter As FCA.PSD007.Submitter(XMLNAME = "Submitter") [ Required ];

Property ReportDetails As FCA.PSD007.ReportDetails(XMLNAME = "ReportDetails") [ Required ];

/// The %DeleteTrigger unified trigger is generated in order to cascade SQL deletes of an XML tree.
Trigger %DeleteTrigger [ Event = DELETE, Foreach = row/object ]
{
 New sc
 Set oref=..%OpenId({%%ID},,.sc) If $$$ISERR(sc) Quit sc
 Set oid=oref.SubmitterGetObject()
 If oid'="" Set sc1=##class(FCA.PSD007.Submitter).%Delete(oid) If $$$ISERR(sc1),$$$GETERRORCODE(sc1)'=$$$ERRORCODE($$$DeleteObjectNotFound) Set sc=$$$ADDSC(sc,sc1)
 Set oid=oref.ReportDetailsGetObject()
 If oid'="" Set sc1=##class(FCA.PSD007.ReportDetails).%Delete(oid) If $$$ISERR(sc1),$$$GETERRORCODE(sc1)'=$$$ERRORCODE($$$DeleteObjectNotFound) Set sc=$$$ADDSC(sc,sc1)
 If $$$ISERR(sc) Set %ok=0,%msg=$system.Status.GetErrorText(sc) 
 Quit
}

Storage Default
{
<Data name="PSDFeedHeaderDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Submitter</Value>
</Value>
<Value name="3">
<Value>ReportDetails</Value>
</Value>
</Data>
<DataLocation>^FCA.PSD007.PSDFeedHeaderD</DataLocation>
<DefaultData>PSDFeedHeaderDefaultData</DefaultData>
<IdLocation>^FCA.PSD007.PSDFeedHeaderD</IdLocation>
<IndexLocation>^FCA.PSD007.PSDFeedHeaderI</IndexLocation>
<StreamLocation>^FCA.PSD007.PSDFeedHeaderS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
