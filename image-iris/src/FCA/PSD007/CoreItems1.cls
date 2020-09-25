/// Defines the elements that are common to all transactions.
/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/CommonTypes/v10/CommonTypes-Schema.xsd
Class FCA.PSD007.CoreItems1 Extends (%Persistent, %XML.Adaptor) [ CompileAfter = (FCA.PSD007.FRNType, FCA.PSD007.NonEmptyString), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "urn:fsa-gov-uk:MER:PSD007:2";

Parameter XMLNAME = "CoreItems";

Parameter XMLSEQUENCE = 1;

Parameter XMLTYPE = "CoreItems";

/// The FRN code of the reporting firm for this transaction.
Property FirmReferenceNumber As FCA.PSD007.FRNType(XMLNAME = "FirmReferenceNumber") [ Required ];

/// The unique reference, internal to the reporting firm, that will enable the firm to provide the FSA with more information concerning the trade if required. This reference must be unique within each report file, with the exception that a reference can occur twice if one occurrence is a cancellation.
Property TransRef As FCA.PSD007.NonEmptyString(MAXLEN = 25, XMLNAME = "TransRef") [ Required ];

/// Indicates if the transaction is a cancellation. If ommitted this is logically the same as providing a value of 'false'.
Property Cancellation As %Boolean(XMLNAME = "Cancellation");

Storage Default
{
<Data name="CoreItems1DefaultData">
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
<DataLocation>^FCA.PSD007.CoreItems1D</DataLocation>
<DefaultData>CoreItems1DefaultData</DefaultData>
<IdLocation>^FCA.PSD007.CoreItems1D</IdLocation>
<IndexLocation>^FCA.PSD007.CoreItems1I</IndexLocation>
<StreamLocation>^FCA.PSD007.CoreItems1S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
