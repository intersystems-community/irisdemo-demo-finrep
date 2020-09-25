/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/PSD007/v2/PSD007-Schema.xsd
Class FCA.PSD007.PerformanceSalesData Extends (%Persistent, %XML.Adaptor) [ CompileAfter = (FCA.PSD007.MonetaryType, FCA.PSD007.NonNegativeIntegerType, FCA.PSD007.NonNegativeMonetaryType, FCA.PSD007.PercentDP2Type, FCA.PSD007.YNType), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "urn:fsa-gov-uk:MER:PSD007:2";

Parameter XMLNAME = "PerformanceSalesData";

Parameter XMLSEQUENCE = 1;

Property OutstandingBalance As FCA.PSD007.MonetaryType(XMLNAME = "OutstandingBalance") [ Required ];

Property MonthlyPayment As FCA.PSD007.NonNegativeMonetaryType(XMLNAME = "MonthlyPayment") [ Required ];

Property ValueLinkedAccounts As FCA.PSD007.MonetaryType(XMLNAME = "ValueLinkedAccounts") [ Required ];

Property GrossInterestCharged As FCA.PSD007.PercentDP2Type(XMLNAME = "GrossInterestCharged") [ Required ];

Property TypeIntRate As %String(MAXLEN = "", VALUELIST = ",01,02,04,05,06,07,08,99", XMLNAME = "TypeIntRate") [ Required ];

Property IncentivisedRate As FCA.PSD007.YNType(XMLNAME = "IncentivisedRate") [ Required ];

Property DateIncentiveEnds As %Date(XMLNAME = "DateIncentiveEnds");

Property RemainingTerm As FCA.PSD007.NonNegativeIntegerType(XMLNAME = "RemainingTerm") [ Required ];

Property MonthsPastMaturity As FCA.PSD007.NonNegativeIntegerType(XMLNAME = "MonthsPastMaturity") [ Required ];

Property RepaymentMethod As %String(MAXLEN = "", VALUELIST = ",C,I,M", XMLNAME = "RepaymentMethod") [ Required ];

Property ReasonForClosure As %String(MAXLEN = "", VALUELIST = ",R,M,P,A,V,O", XMLNAME = "ReasonForClosure");

Property CurrentPaymentShortfall As FCA.PSD007.NonNegativeMonetaryType(XMLNAME = "CurrentPaymentShortfall") [ Required ];

Property ArrearsStartDate As %Date(XMLNAME = "ArrearsStartDate");

Property PaymentShortfallArrangement As FCA.PSD007.YNType(XMLNAME = "PaymentShortfallArrangement") [ Required ];

Property DateFormalArrangement As %Date(XMLNAME = "DateFormalArrangement");

Property PaymentShortfallCapitalisation As FCA.PSD007.YNType(XMLNAME = "PaymentShortfallCapitalisation") [ Required ];

Property CapitalisationDate As %Date(XMLNAME = "CapitalisationDate");

Property SwitchInterestOnly As FCA.PSD007.YNType(XMLNAME = "SwitchInterestOnly") [ Required ];

Property InterestOnlyDate As %Date(XMLNAME = "InterestOnlyDate");

Property PaymentsSuspended As FCA.PSD007.YNType(XMLNAME = "PaymentsSuspended") [ Required ];

Property DatesPaymentsSuspended As %Date(XMLNAME = "DatesPaymentsSuspended");

Property ReducedPayments As FCA.PSD007.YNType(XMLNAME = "ReducedPayments") [ Required ];

Property DateReducedPayments As %Date(XMLNAME = "DateReducedPayments");

Property TermExtension As FCA.PSD007.YNType(XMLNAME = "TermExtension") [ Required ];

Property DateTermExtension As %Date(XMLNAME = "DateTermExtension");

Property OtherForbearance As FCA.PSD007.YNType(XMLNAME = "OtherForbearance") [ Required ];

Property DateOtherForbearance As %Date(XMLNAME = "DateOtherForbearance");

Property DateLitigationStarted As %Date(XMLNAME = "DateLitigationStarted");

Property PossessionOrder As FCA.PSD007.YNType(XMLNAME = "PossessionOrder") [ Required ];

Property DatePossession As %Date(XMLNAME = "DatePossession");

Property RepossessionSaleValueAchieved As FCA.PSD007.MonetaryType(XMLNAME = "RepossessionSaleValueAchieved");

Property SecondChargeMortgage As FCA.PSD007.YNType(XMLNAME = "SecondChargeMortgage");

Storage Default
{
<Data name="PerformanceSalesDataDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>OutstandingBalance</Value>
</Value>
<Value name="3">
<Value>MonthlyPayment</Value>
</Value>
<Value name="4">
<Value>ValueLinkedAccounts</Value>
</Value>
<Value name="5">
<Value>GrossInterestCharged</Value>
</Value>
<Value name="6">
<Value>TypeIntRate</Value>
</Value>
<Value name="7">
<Value>IncentivisedRate</Value>
</Value>
<Value name="8">
<Value>DateIncentiveEnds</Value>
</Value>
<Value name="9">
<Value>RemainingTerm</Value>
</Value>
<Value name="10">
<Value>MonthsPastMaturity</Value>
</Value>
<Value name="11">
<Value>RepaymentMethod</Value>
</Value>
<Value name="12">
<Value>ReasonForClosure</Value>
</Value>
<Value name="13">
<Value>CurrentPaymentShortfall</Value>
</Value>
<Value name="14">
<Value>ArrearsStartDate</Value>
</Value>
<Value name="15">
<Value>PaymentShortfallArrangement</Value>
</Value>
<Value name="16">
<Value>DateFormalArrangement</Value>
</Value>
<Value name="17">
<Value>PaymentShortfallCapitalisation</Value>
</Value>
<Value name="18">
<Value>CapitalisationDate</Value>
</Value>
<Value name="19">
<Value>SwitchInterestOnly</Value>
</Value>
<Value name="20">
<Value>InterestOnlyDate</Value>
</Value>
<Value name="21">
<Value>PaymentsSuspended</Value>
</Value>
<Value name="22">
<Value>DatesPaymentsSuspended</Value>
</Value>
<Value name="23">
<Value>ReducedPayments</Value>
</Value>
<Value name="24">
<Value>DateReducedPayments</Value>
</Value>
<Value name="25">
<Value>TermExtension</Value>
</Value>
<Value name="26">
<Value>DateTermExtension</Value>
</Value>
<Value name="27">
<Value>OtherForbearance</Value>
</Value>
<Value name="28">
<Value>DateOtherForbearance</Value>
</Value>
<Value name="29">
<Value>DateLitigationStarted</Value>
</Value>
<Value name="30">
<Value>PossessionOrder</Value>
</Value>
<Value name="31">
<Value>DatePossession</Value>
</Value>
<Value name="32">
<Value>RepossessionSaleValueAchieved</Value>
</Value>
<Value name="33">
<Value>SecondChargeMortgage</Value>
</Value>
</Data>
<DataLocation>^FCA.PSD007.Performance6439D</DataLocation>
<DefaultData>PerformanceSalesDataDefaultData</DefaultData>
<IdLocation>^FCA.PSD007.Performance6439D</IdLocation>
<IndexLocation>^FCA.PSD007.Performance6439I</IndexLocation>
<StreamLocation>^FCA.PSD007.Performance6439S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
