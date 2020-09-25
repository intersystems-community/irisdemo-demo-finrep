/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/PSD007/v2/PSD007-Schema.xsd
Class FCA.PSD007.CoreItems Extends (%Persistent, %XML.Adaptor) [ CompileAfter = (FCA.PSD007.FRNType, FCA.PSD007.NonNegativeIntegerType, FCA.PSD007.NonNegativeMonetaryType, FCA.PSD007.PostCodeType, FCA.PSD007.String100Type, FCA.PSD007.YNType), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "urn:fsa-gov-uk:MER:PSD007:2";

Parameter XMLNAME = "CoreItems";

Parameter XMLSEQUENCE = 1;

Property AdminFRN As FCA.PSD007.FRNType(XMLNAME = "AdminFRN");

Property Postcode As FCA.PSD007.PostCodeType(XMLNAME = "Postcode") [ Required ];

Property MainDOB As %Date(XMLNAME = "MainDOB") [ Required ];

Property AcctOpenedDate As %Date(XMLNAME = "AcctOpenedDate");

Property TransRef As FCA.PSD007.String100Type(XMLNAME = "TransRef") [ Required ];

Property DateofBalance As %Date(XMLNAME = "DateofBalance") [ Required ];

Property LoanPurchase As FCA.PSD007.YNType(XMLNAME = "LoanPurchase") [ Required ];

Property OrigLoanSize As FCA.PSD007.NonNegativeMonetaryType(XMLNAME = "OrigLoanSize");

Property OrigLoanTerm As FCA.PSD007.NonNegativeIntegerType(XMLNAME = "OrigLoanTerm");

Property OrigProviderFRN As FCA.PSD007.FRNType(XMLNAME = "OrigProviderFRN");

Property Cancellation As %Boolean(XMLNAME = "Cancellation");

Storage Default
{
<Data name="CoreItemsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>AdminFRN</Value>
</Value>
<Value name="3">
<Value>Postcode</Value>
</Value>
<Value name="4">
<Value>MainDOB</Value>
</Value>
<Value name="5">
<Value>AcctOpenedDate</Value>
</Value>
<Value name="6">
<Value>TransRef</Value>
</Value>
<Value name="7">
<Value>DateofBalance</Value>
</Value>
<Value name="8">
<Value>LoanPurchase</Value>
</Value>
<Value name="9">
<Value>OrigLoanSize</Value>
</Value>
<Value name="10">
<Value>OrigLoanTerm</Value>
</Value>
<Value name="11">
<Value>OrigProviderFRN</Value>
</Value>
<Value name="12">
<Value>Cancellation</Value>
</Value>
</Data>
<DataLocation>^FCA.PSD007.CoreItemsD</DataLocation>
<DefaultData>CoreItemsDefaultData</DefaultData>
<IdLocation>^FCA.PSD007.CoreItemsD</IdLocation>
<IndexLocation>^FCA.PSD007.CoreItemsI</IndexLocation>
<StreamLocation>^FCA.PSD007.CoreItemsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
