Class Canonical.MortgagePerf Extends Normalization.NormalizedData
{

Property AsOfDate As %Date [ SqlColumnNumber = 2 ];

Property Mortgage As Mortgage [ SqlColumnNumber = 3 ];

Property LoanPurchase As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 5 ];

Property OrigProviderFRN As %String [ SqlColumnNumber = 6 ];

Property OutstandingBalance As %Double [ SqlColumnNumber = 7 ];

Property ValueLinkedAccounts As %String [ SqlColumnNumber = 8 ];

Property IncentivisedRate As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 9 ];

Property RemainingTerm As %Integer [ SqlColumnNumber = 10 ];

Property MonthsPastMaturity As %Integer [ SqlColumnNumber = 11 ];

Property ReasonForClosure As Canonical.CT.ReasonForClosure [ SqlColumnNumber = 12 ];

Property CurrentPaymentShortfall As %Integer [ SqlColumnNumber = 13 ];

Property ArrearsStartDate As %Date [ SqlColumnNumber = 14 ];

Property PaymentShortfallArrangement As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 15 ];

Property DateFormalArrangement As %Date [ SqlColumnNumber = 16 ];

Property PaymentShortfallCapitalisation As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 17 ];

Property CapitalisationDate As %Date [ SqlColumnNumber = 18 ];

Property SwitchInterestOnly As %String [ SqlColumnNumber = 19 ];

Property InterestOnlyDate As %Date [ SqlColumnNumber = 20 ];

Property PaymentsSuspended As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 21 ];

Property DatesPaymentsSuspended As %String [ SqlColumnNumber = 22 ];

Property ReducedPayments As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 23 ];

Property DateReducedPayments As %Date [ SqlColumnNumber = 24 ];

Property TermExtension As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 25 ];

Property DateTermExtension As %Date [ SqlColumnNumber = 26 ];

Property OtherForbearance As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 27 ];

Property DateOtherForbearance As %Date [ SqlColumnNumber = 28 ];

Property DateLitigationStarted As %Date [ SqlColumnNumber = 29 ];

Property PossessionOrder As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 30 ];

Property DatePossession As %Date [ SqlColumnNumber = 31 ];

Property RepossessionSaleValueAchieved As %String [ SqlColumnNumber = 32 ];

Property DateofBalance As %Date [ SqlColumnNumber = 33 ];

Property SecondChargeMortgage As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 34 ];

Property BeneficialOwnerRegFirm As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 35 ];

Property BeneficialOwnerFRN As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 36 ];

Property BeneficialOwnerName As %String [ SqlColumnNumber = 37 ];

Property LegalOwnerRegFirm As %String [ SqlColumnNumber = 38 ];

Property LegalOwnerFRN As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 39 ];

Property LegalOwnerName As %String [ SqlColumnNumber = 40 ];

Property ClosedBook As %String [ SqlColumnNumber = 41 ];

Index FirmAndTransIndex On (Mortgage, AsOfDate) [ Data = %BatchRecordStatus, PrimaryKey ];

Storage Default
{
<Data name="MortgagePerfDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>%BatchControlRecord</Value>
</Value>
<Value name="3">
<Value>%OriginalBatchRecordId</Value>
</Value>
<Value name="4">
<Value>%BatchRecordStatus</Value>
</Value>
<Value name="5">
<Value>OrigProviderFRN</Value>
</Value>
<Value name="6">
<Value>OutstandingBalance</Value>
</Value>
<Value name="7">
<Value>ValueLinkedAccounts</Value>
</Value>
<Value name="8">
<Value>IncentivisedRate</Value>
</Value>
<Value name="9">
<Value>RemainingTerm</Value>
</Value>
<Value name="10">
<Value>MonthsPastMaturity</Value>
</Value>
<Value name="11">
<Value>ReasonForClosure</Value>
</Value>
<Value name="12">
<Value>CurrentPaymentShortfall</Value>
</Value>
<Value name="13">
<Value>ArrearsStartDate</Value>
</Value>
<Value name="14">
<Value>PaymentShortfallArrangement</Value>
</Value>
<Value name="15">
<Value>DateFormalArrangement</Value>
</Value>
<Value name="16">
<Value>PaymentShortfallCapitalisation</Value>
</Value>
<Value name="17">
<Value>CapitalisationDate</Value>
</Value>
<Value name="18">
<Value>SwitchInterestOnly</Value>
</Value>
<Value name="19">
<Value>InterestOnlyDate</Value>
</Value>
<Value name="20">
<Value>PaymentsSuspended</Value>
</Value>
<Value name="21">
<Value>DatesPaymentsSuspended</Value>
</Value>
<Value name="22">
<Value>ReducedPayments</Value>
</Value>
<Value name="23">
<Value>DateReducedPayments</Value>
</Value>
<Value name="24">
<Value>TermExtension</Value>
</Value>
<Value name="25">
<Value>DateTermExtension</Value>
</Value>
<Value name="26">
<Value>OtherForbearance</Value>
</Value>
<Value name="27">
<Value>DateOtherForbearance</Value>
</Value>
<Value name="28">
<Value>DateLitigationStarted</Value>
</Value>
<Value name="29">
<Value>PossessionOrder</Value>
</Value>
<Value name="30">
<Value>DatePossession</Value>
</Value>
<Value name="31">
<Value>RepossessionSaleValueAchieved</Value>
</Value>
<Value name="32">
<Value>DateofBalance</Value>
</Value>
<Value name="33">
<Value>SecondChargeMortgage</Value>
</Value>
<Value name="34">
<Value>BeneficialOwnerRegFirm</Value>
</Value>
<Value name="35">
<Value>BeneficialOwnerFRN</Value>
</Value>
<Value name="36">
<Value>BeneficialOwnerName</Value>
</Value>
<Value name="37">
<Value>LegalOwnerRegFirm</Value>
</Value>
<Value name="38">
<Value>LegalOwnerFRN</Value>
</Value>
<Value name="39">
<Value>LegalOwnerName</Value>
</Value>
<Value name="40">
<Value>ClosedBook</Value>
</Value>
<Value name="41">
<Value>AsOfDate</Value>
</Value>
<Value name="42">
<Value>LoanPurchase</Value>
</Value>
<Value name="43">
<Value>Mortgage</Value>
</Value>
</Data>
<DataLocation>^Canonical.MortgagePerfD</DataLocation>
<DefaultData>MortgagePerfDefaultData</DefaultData>
<IdLocation>^Canonical.MortgagePerfD</IdLocation>
<IndexLocation>^Canonical.MortgagePerfI</IndexLocation>
<StreamLocation>^Canonical.MortgagePerfS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
