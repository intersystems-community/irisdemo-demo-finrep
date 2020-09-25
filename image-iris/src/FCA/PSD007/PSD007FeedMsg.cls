/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/PSD007/v2/PSD007-Schema.xsd
Class FCA.PSD007.PSD007FeedMsg Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "urn:fsa-gov-uk:MER:PSD007:2";

Parameter XMLNAME = "PSD007FeedMsg";

Parameter XMLSEQUENCE = 1;

Index PSD007MortgagePerformanceSalesDataIndex On PSD007MortgagePerformanceSalesData;

Property CoreItems As FCA.PSD007.CoreItems(XMLNAME = "CoreItems") [ Required ];

Property PerformanceSalesData As FCA.PSD007.PerformanceSalesData(XMLNAME = "PerformanceSalesData") [ Required ];

Relationship PSD007MortgagePerformanceSalesData As FCA.PSD007.PSD007MortgagePerformanceSalesData(XMLPROJECTION = "NONE") [ Cardinality = one, Inverse = PSD007FeedMsg, OnDelete = cascade ];

/// The %DeleteTrigger unified trigger is generated in order to cascade SQL deletes of an XML tree.
Trigger %DeleteTrigger [ Event = DELETE, Foreach = row/object ]
{
 New sc
 Set oref=..%OpenId({%%ID},,.sc) If $$$ISERR(sc) Quit sc
 Set oid=oref.CoreItemsGetObject()
 If oid'="" Set sc1=##class(FCA.PSD007.CoreItems).%Delete(oid) If $$$ISERR(sc1),$$$GETERRORCODE(sc1)'=$$$ERRORCODE($$$DeleteObjectNotFound) Set sc=$$$ADDSC(sc,sc1)
 Set oid=oref.PerformanceSalesDataGetObject()
 If oid'="" Set sc1=##class(FCA.PSD007.PerformanceSalesData).%Delete(oid) If $$$ISERR(sc1),$$$GETERRORCODE(sc1)'=$$$ERRORCODE($$$DeleteObjectNotFound) Set sc=$$$ADDSC(sc,sc1)
 If $$$ISERR(sc) Set %ok=0,%msg=$system.Status.GetErrorText(sc) 
 Quit
}

Storage Default
{
<Data name="PSD007FeedMsgDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CoreItems</Value>
</Value>
<Value name="3">
<Value>PerformanceSalesData</Value>
</Value>
<Value name="4">
<Value>PSD007MortgagePerformanceSalesData</Value>
</Value>
</Data>
<DataLocation>^FCA.PSD007.PSD007FeedMsgD</DataLocation>
<DefaultData>PSD007FeedMsgDefaultData</DefaultData>
<IdLocation>^FCA.PSD007.PSD007FeedMsgD</IdLocation>
<IndexLocation>^FCA.PSD007.PSD007FeedMsgI</IndexLocation>
<StreamLocation>^FCA.PSD007.PSD007FeedMsgS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
