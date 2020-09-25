/// 
Class FCA.PSD007.PSD007MortgagePerformanceSalesData Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "urn:fsa-gov-uk:MER:PSD007:2";

Parameter XMLNAME = "PSD007-MortgagePerformanceSalesData";

Parameter XMLSEQUENCE = 1;

Parameter XMLTYPE = "PSD007-MortgagePerformanceSalesData";

Property PSDFeedHeader As FCA.PSD007.PSDFeedHeader(XMLNAME = "PSDFeedHeader") [ Required ];

/// Defines the individual transactions to be reported
Relationship PSD007FeedMsg As FCA.PSD007.PSD007FeedMsg(XMLNAME = "PSD007FeedMsg", XMLPROJECTION = "ELEMENT") [ Cardinality = many, Inverse = PSD007MortgagePerformanceSalesData ];

Property currency As %String(MAXLEN = "", XMLNAME = "currency", XMLPROJECTION = "ATTRIBUTE") [ InitialExpression = "GBP", ReadOnly, Required ];

/// The %DeleteTrigger unified trigger is generated in order to cascade SQL deletes of an XML tree.
Trigger %DeleteTrigger [ Event = DELETE, Foreach = row/object ]
{
 New sc
 Set oref=..%OpenId({%%ID},,.sc) If $$$ISERR(sc) Quit sc
 Set oid=oref.PSDFeedHeaderGetObject()
 If oid'="" Set sc1=##class(FCA.PSD007.PSDFeedHeader).%Delete(oid) If $$$ISERR(sc1),$$$GETERRORCODE(sc1)'=$$$ERRORCODE($$$DeleteObjectNotFound) Set sc=$$$ADDSC(sc,sc1)
 If $$$ISERR(sc) Set %ok=0,%msg=$system.Status.GetErrorText(sc) 
 Quit
}

Storage Default
{
<Data name="PSD007MortgagePerformanceSalesDataDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PSDFeedHeader</Value>
</Value>
<Value name="3">
<Value>currency</Value>
</Value>
</Data>
<DataLocation>^FCA.PSD007.PSD007MortgCD65D</DataLocation>
<DefaultData>PSD007MortgagePerformanceSalesDataDefaultData</DefaultData>
<IdLocation>^FCA.PSD007.PSD007MortgCD65D</IdLocation>
<IndexLocation>^FCA.PSD007.PSD007MortgCD65I</IndexLocation>
<StreamLocation>^FCA.PSD007.PSD007MortgCD65S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
