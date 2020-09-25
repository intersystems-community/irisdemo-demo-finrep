/// Defines the report header, common to all reports.
Class FCA.PSD001.cmn.FSAFeedHeader Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAFeedCommon-v1-2";

Parameter XMLNAME = "FSAFeedHeader";

Parameter XMLSEQUENCE = 1;

/// Identifies the version of the business specific schema to which this report conforms.
Property FeedTargetSchemaVersion As %String(MAXLEN = "", XMLNAME = "FeedTargetSchemaVersion") [ Required ];

Property Submitter As FCA.PSD001.cmn.Submitter(XMLNAME = "Submitter") [ Required ];

Property ReportDetails As FCA.PSD001.cmn.ReportDetails(XMLNAME = "ReportDetails") [ Required ];

/// The %DeleteTrigger unified trigger is generated in order to cascade SQL deletes of an XML tree.
Trigger %DeleteTrigger [ Event = DELETE, Foreach = row/object ]
{
 New sc
 Set oref=..%OpenId({%%ID},,.sc) If $$$ISERR(sc) Quit sc
 Set oid=oref.SubmitterGetObject()
 If oid'="" Set sc1=##class(FCA.PSD001.cmn.Submitter).%Delete(oid) If $$$ISERR(sc1),$$$GETERRORCODE(sc1)'=$$$ERRORCODE($$$DeleteObjectNotFound) Set sc=$$$ADDSC(sc,sc1)
 Set oid=oref.ReportDetailsGetObject()
 If oid'="" Set sc1=##class(FCA.PSD001.cmn.ReportDetails).%Delete(oid) If $$$ISERR(sc1),$$$GETERRORCODE(sc1)'=$$$ERRORCODE($$$DeleteObjectNotFound) Set sc=$$$ADDSC(sc,sc1)
 If $$$ISERR(sc) Set %ok=0,%msg=$system.Status.GetErrorText(sc) 
 Quit
}

Storage Default
{
<Data name="FSAFeedHeaderDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FeedTargetSchemaVersion</Value>
</Value>
<Value name="3">
<Value>Submitter</Value>
</Value>
<Value name="4">
<Value>ReportDetails</Value>
</Value>
</Data>
<DataLocation>^FCA.PSD001.cmn.FSAFeedHeaderD</DataLocation>
<DefaultData>FSAFeedHeaderDefaultData</DefaultData>
<IdLocation>^FCA.PSD001.cmn.FSAFeedHeaderD</IdLocation>
<IndexLocation>^FCA.PSD001.cmn.FSAFeedHeaderI</IndexLocation>
<StreamLocation>^FCA.PSD001.cmn.FSAFeedHeaderS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
