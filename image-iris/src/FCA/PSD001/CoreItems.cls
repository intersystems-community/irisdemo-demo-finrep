/// Defines the elements that are common to all transactions.
/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/CommonTypes/v10/CommonTypes-Schema.xsd
Class FCA.PSD001.CoreItems Extends (%Persistent, %XML.Adaptor) [ CompileAfter = (FCA.PSD001.FRNType, FCA.PSD001.NonEmptyString), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAHSFFeedMG-v2";

Parameter XMLNAME = "CoreItems";

Parameter XMLSEQUENCE = 1;

/// The FRN code of the reporting firm for this transaction.
Property FirmReferenceNumber As FCA.PSD001.FRNType(XMLNAME = "FirmReferenceNumber") [ Required ];

/// The unique reference, internal to the reporting firm, that will enable the firm to provide the FSA with more information concerning the trade if required. This reference must be unique within each report file, with the exception that a reference can occur twice if one occurrence is a cancellation.
Property TransRef As FCA.PSD001.NonEmptyString(MAXLEN = 25, XMLNAME = "TransRef") [ Required ];

/// Indicates if the transaction is a cancellation. If ommitted this is logically the same as providing a value of 'false'.
Property Cancellation As %Boolean(XMLNAME = "Cancellation");

Storage Default
{
<Data name="CoreItemsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FirmReferenceNumber</Value>
</Value>
<Value name="3">
<Value>TransRef</Value>
</Value>
<Value name="4">
<Value>Cancellation</Value>
</Value>
</Data>
<DataLocation>^FCA.PSD001.CoreItemsD</DataLocation>
<DefaultData>CoreItemsDefaultData</DefaultData>
<IdLocation>^FCA.PSD001.CoreItemsD</IdLocation>
<IndexLocation>^FCA.PSD001.CoreItemsI</IndexLocation>
<StreamLocation>^FCA.PSD001.CoreItemsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
