/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/PSD001/v2/psd001-schema-v2-2.xsd
Class FCA.PSD001.FSAHSFFeedMGMsg Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAHSFFeedMG-v2";

Parameter XMLNAME = "FSAHSFFeedMGMsg";

Parameter XMLSEQUENCE = 1;

Index FSAHSFFeedMGIndex On FSAHSFFeedMG;

Property CoreItems As FCA.PSD001.cmn.CoreItems(REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAFeedCommon-v1-2", XMLNAME = "CoreItems", XMLREF = 1) [ Required ];

Property Mortgage As FCA.PSD001.Mortgage(XMLNAME = "Mortgage") [ Required ];

Relationship FSAHSFFeedMG As FCA.PSD001.FSAHSFFeedMG(XMLPROJECTION = "NONE") [ Cardinality = one, Inverse = FSAHSFFeedMGMsg, OnDelete = cascade ];

/// The %DeleteTrigger unified trigger is generated in order to cascade SQL deletes of an XML tree.
Trigger %DeleteTrigger [ Event = DELETE, Foreach = row/object ]
{
 New sc
 Set oref=..%OpenId({%%ID},,.sc) If $$$ISERR(sc) Quit sc
 Set oid=oref.CoreItemsGetObject()
 If oid'="" Set sc1=##class(FCA.PSD001.cmn.CoreItems).%Delete(oid) If $$$ISERR(sc1),$$$GETERRORCODE(sc1)'=$$$ERRORCODE($$$DeleteObjectNotFound) Set sc=$$$ADDSC(sc,sc1)
 Set oid=oref.MortgageGetObject()
 If oid'="" Set sc1=##class(FCA.PSD001.Mortgage).%Delete(oid) If $$$ISERR(sc1),$$$GETERRORCODE(sc1)'=$$$ERRORCODE($$$DeleteObjectNotFound) Set sc=$$$ADDSC(sc,sc1)
 If $$$ISERR(sc) Set %ok=0,%msg=$system.Status.GetErrorText(sc) 
 Quit
}

Storage Default
{
<Data name="FSAHSFFeedMGMsgDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CoreItems</Value>
</Value>
<Value name="3">
<Value>Mortgage</Value>
</Value>
<Value name="4">
<Value>FSAHSFFeedMG</Value>
</Value>
</Data>
<DataLocation>^FCA.PSD001.FSAHSFFeedMGMsgD</DataLocation>
<DefaultData>FSAHSFFeedMGMsgDefaultData</DefaultData>
<IdLocation>^FCA.PSD001.FSAHSFFeedMGMsgD</IdLocation>
<IndexLocation>^FCA.PSD001.FSAHSFFeedMGMsgI</IndexLocation>
<StreamLocation>^FCA.PSD001.FSAHSFFeedMGMsgS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
