/// 
Class FCA.PSD001.FSAHSFFeedMG Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAHSFFeedMG-v2";

Parameter XMLNAME = "FSAHSFFeedMG";

Parameter XMLSEQUENCE = 1;

Property FSAFeedHeader As FCA.PSD001.cmn.FSAFeedHeader(REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAFeedCommon-v1-2", XMLNAME = "FSAFeedHeader", XMLREF = 1) [ Required ];

/// Defines the individual transactions to be reported
Relationship FSAHSFFeedMGMsg As FCA.PSD001.FSAHSFFeedMGMsg(XMLNAME = "FSAHSFFeedMGMsg", XMLPROJECTION = "ELEMENT") [ Cardinality = many, Inverse = FSAHSFFeedMG ];

/// The %DeleteTrigger unified trigger is generated in order to cascade SQL deletes of an XML tree.
Trigger %DeleteTrigger [ Event = DELETE, Foreach = row/object ]
{
 New sc
 Set oref=..%OpenId({%%ID},,.sc) If $$$ISERR(sc) Quit sc
 Set oid=oref.FSAFeedHeaderGetObject()
 If oid'="" Set sc1=##class(FCA.PSD001.cmn.FSAFeedHeader).%Delete(oid) If $$$ISERR(sc1),$$$GETERRORCODE(sc1)'=$$$ERRORCODE($$$DeleteObjectNotFound) Set sc=$$$ADDSC(sc,sc1)
 If $$$ISERR(sc) Set %ok=0,%msg=$system.Status.GetErrorText(sc) 
 Quit
}

Storage Default
{
<Data name="FSAHSFFeedMGDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FSAFeedHeader</Value>
</Value>
</Data>
<DataLocation>^FCA.PSD001.FSAHSFFeedMGD</DataLocation>
<DefaultData>FSAHSFFeedMGDefaultData</DefaultData>
<IdLocation>^FCA.PSD001.FSAHSFFeedMGD</IdLocation>
<IndexLocation>^FCA.PSD001.FSAHSFFeedMGI</IndexLocation>
<StreamLocation>^FCA.PSD001.FSAHSFFeedMGS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
