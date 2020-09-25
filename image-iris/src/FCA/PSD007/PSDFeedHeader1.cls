/// Defines the report header, common to all reports.
/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/CommonTypes/v10/CommonTypes-Schema.xsd
Class FCA.PSD007.PSDFeedHeader1 Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "urn:fsa-gov-uk:MER:PSD007:2";

Parameter XMLNAME = "PSDFeedHeader";

Parameter XMLSEQUENCE = 1;

Parameter XMLTYPE = "PSDFeedHeader";

Property Submitter As FCA.PSD007.Submitter1(XMLNAME = "Submitter") [ Required ];

Property ReportDetails As FCA.PSD007.ReportDetails1(XMLNAME = "ReportDetails") [ Required ];

/// The %DeleteTrigger unified trigger is generated in order to cascade SQL deletes of an XML tree.
Trigger %DeleteTrigger [ Event = DELETE, Foreach = row/object ]
{
 New sc
 Set oref=..%OpenId({%%ID},,.sc) If $$$ISERR(sc) Quit sc
 Set oid=oref.SubmitterGetObject()
 If oid'="" Set sc1=##class(FCA.PSD007.Submitter1).%Delete(oid) If $$$ISERR(sc1),$$$GETERRORCODE(sc1)'=$$$ERRORCODE($$$DeleteObjectNotFound) Set sc=$$$ADDSC(sc,sc1)
 Set oid=oref.ReportDetailsGetObject()
 If oid'="" Set sc1=##class(FCA.PSD007.ReportDetails1).%Delete(oid) If $$$ISERR(sc1),$$$GETERRORCODE(sc1)'=$$$ERRORCODE($$$DeleteObjectNotFound) Set sc=$$$ADDSC(sc,sc1)
 If $$$ISERR(sc) Set %ok=0,%msg=$system.Status.GetErrorText(sc) 
 Quit
}

Storage Default
{
<Data name="PSDFeedHeader1DefaultData">
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
<DataLocation>^FCA.PSD007.PSDFeedHeader1D</DataLocation>
<DefaultData>PSDFeedHeader1DefaultData</DefaultData>
<IdLocation>^FCA.PSD007.PSDFeedHeader1D</IdLocation>
<IndexLocation>^FCA.PSD007.PSDFeedHeader1I</IndexLocation>
<StreamLocation>^FCA.PSD007.PSDFeedHeader1S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
