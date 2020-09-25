/// Defines the elements that are common to all transactions.
Class FCA.PSD001.cmn.CoreItems Extends (%Persistent, %XML.Adaptor) [ CompileAfter = (FCA.PSD001.cmn.FSARefType, FCA.PSD001.cmn.NonEmptyString), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAFeedCommon-v1-2";

Parameter XMLNAME = "CoreItems";

Parameter XMLSEQUENCE = 1;

/// The FSA code of the reporting firm for this transaction.
Property FirmFSARef As FCA.PSD001.cmn.FSARefType(XMLNAME = "FirmFSARef") [ Required ];

/// The unique reference, internal to the reporting firm, that will enable the firm to provide the FSA with more information concerning the trade if required. This reference must be unique within each report file, with the exception that a reference can occur twice if one occurrence is a cancellation.
Property TransRef As FCA.PSD001.cmn.NonEmptyString(MAXLEN = 25, XMLNAME = "TransRef") [ Required ];

/// Indicates if the transaction is a cancellation. If ommitted this is logically the same as providing a value of 'false'.
Property Cancellation As %Boolean(XMLNAME = "Cancellation");

Storage Default
{
<Data name="CoreItemsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FirmFSARef</Value>
</Value>
<Value name="3">
<Value>TransRef</Value>
</Value>
<Value name="4">
<Value>Cancellation</Value>
</Value>
</Data>
<DataLocation>^FCA.PSD001.cmn.CoreItemsD</DataLocation>
<DefaultData>CoreItemsDefaultData</DefaultData>
<IdLocation>^FCA.PSD001.cmn.CoreItemsD</IdLocation>
<IndexLocation>^FCA.PSD001.cmn.CoreItemsI</IndexLocation>
<StreamLocation>^FCA.PSD001.cmn.CoreItemsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
