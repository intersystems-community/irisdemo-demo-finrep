/// RECORDMAP: Generated from RecordMap 'Staging.RM.MortgagePerf'
/// on 2020-09-14 at 17:43:14.061 [2020-09-14 17:43:14.061 UTC]
/// by user SuperUser
Class Staging.RM.MortgagePerf.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property LegacyAsOfDate As %String [ SqlColumnNumber = 2 ];

Property LegacyFirmId As %String [ SqlColumnNumber = 3 ];

Property LegacyTransRef As %String [ SqlColumnNumber = 4 ];

Property LegacyLoanPurchase As %String [ SqlColumnNumber = 5 ];

Property LegacyOrigProviderFRN As %String [ SqlColumnNumber = 6 ];

Property LegacyOutstandingBalance As %String [ SqlColumnNumber = 7 ];

Property LegacyValueLinkedAccounts As %String [ SqlColumnNumber = 8 ];

Property LegacyIncentivisedRate As %String [ SqlColumnNumber = 9 ];

Property LegacyRemainingTerm As %String [ SqlColumnNumber = 10 ];

Property LegacyMonthsPastMaturity As %String [ SqlColumnNumber = 11 ];

Property LegacyReasonForClosure As %String [ SqlColumnNumber = 12 ];

Property LegacyCurrentPaymentShortfall As %String [ SqlColumnNumber = 13 ];

Property LegacyArrearsStartDate As %String [ SqlColumnNumber = 14 ];

Property LegacyPaymentShortfallArrangement As %String [ SqlColumnNumber = 15 ];

Property LegacyDateFormalArrangement As %String [ SqlColumnNumber = 16 ];

Property LegacyPaymentShortfallCapitalisation As %String [ SqlColumnNumber = 17 ];

Property LegacyCapitalisationDate As %String [ SqlColumnNumber = 18 ];

Property LegacyInterestOnlyDate As %String [ SqlColumnNumber = 19 ];

Property LegacyPaymentsSuspended As %String [ SqlColumnNumber = 20 ];

Property LegacyDatesPaymentsSuspended As %String [ SqlColumnNumber = 21 ];

Property LegacyReducedPayments As %String [ SqlColumnNumber = 22 ];

Property LegacyDateReducedPayments As %String [ SqlColumnNumber = 23 ];

Property LegacyTermExtension As %String [ SqlColumnNumber = 24 ];

Property LegacyDateTermExtension As %String [ SqlColumnNumber = 25 ];

Property LegacyOtherForbearance As %String [ SqlColumnNumber = 26 ];

Property LegacyDateOtherForbearance As %String [ SqlColumnNumber = 27 ];

Property LegacyDateLitigationStarted As %String [ SqlColumnNumber = 28 ];

Property LegacyPossessionOrder As %String [ SqlColumnNumber = 29 ];

Property LegacyDatePossession As %String [ SqlColumnNumber = 30 ];

Property LegacyRepossessionSaleValueAchieved As %String [ SqlColumnNumber = 31 ];

Property LegacyDateofBalance As %String [ SqlColumnNumber = 32 ];

Property LegacySecondChargeMortgage As %String [ SqlColumnNumber = 33 ];

Property LegacyBeneficialOwnerRegFirm As %String [ SqlColumnNumber = 34 ];

Property LegacyBeneficialOwnerFRN As %String [ SqlColumnNumber = 35 ];

Property LegacyBeneficialOwnerName As %String [ SqlColumnNumber = 36 ];

Property LegacyLegalOwnerRegFirm As %String [ SqlColumnNumber = 37 ];

Property LegacyLegalOwnerFRN As %String [ SqlColumnNumber = 38 ];

Property LegacyLegalOwnerName As %String [ SqlColumnNumber = 39 ];

Property LegacyClosedBook As %String [ SqlColumnNumber = 40 ];

Parameter RECORDMAPGENERATED = 1;

Relationship %ParentBatch As Staging.RM.MortgagePerf.Batch [ Cardinality = one, Inverse = Records ];

Index %ParentBatchIdx On %ParentBatch;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>LegacyAsOfDate</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>LegacyTransRef</Value>
</Value>
<Value name="5">
<Value>LegacyLoanPurchase</Value>
</Value>
<Value name="6">
<Value>LegacyOrigProviderFRN</Value>
</Value>
<Value name="7">
<Value>LegacyOutstandingBalance</Value>
</Value>
<Value name="8">
<Value>LegacyValueLinkedAccounts</Value>
</Value>
<Value name="9">
<Value>LegacyIncentivisedRate</Value>
</Value>
<Value name="10">
<Value>LegacyRemainingTerm</Value>
</Value>
<Value name="11">
<Value>LegacyMonthsPastMaturity</Value>
</Value>
<Value name="12">
<Value>LegacyReasonForClosure</Value>
</Value>
<Value name="13">
<Value>LegacyCurrentPaymentShortfall</Value>
</Value>
<Value name="14">
<Value>LegacyArrearsStartDate</Value>
</Value>
<Value name="15">
<Value>LegacyPaymentShortfallArrangement</Value>
</Value>
<Value name="16">
<Value>LegacyDateFormalArrangement</Value>
</Value>
<Value name="17">
<Value>LegacyPaymentShortfallCapitalisation</Value>
</Value>
<Value name="18">
<Value>LegacyCapitalisationDate</Value>
</Value>
<Value name="19">
<Value>LegacyInterestOnlyDate</Value>
</Value>
<Value name="20">
<Value>LegacyPaymentsSuspended</Value>
</Value>
<Value name="21">
<Value>LegacyDatesPaymentsSuspended</Value>
</Value>
<Value name="22">
<Value>LegacyReducedPayments</Value>
</Value>
<Value name="23">
<Value>LegacyDateReducedPayments</Value>
</Value>
<Value name="24">
<Value>LegacyTermExtension</Value>
</Value>
<Value name="25">
<Value>LegacyDateTermExtension</Value>
</Value>
<Value name="26">
<Value>LegacyOtherForbearance</Value>
</Value>
<Value name="27">
<Value>LegacyDateOtherForbearance</Value>
</Value>
<Value name="28">
<Value>LegacyDateLitigationStarted</Value>
</Value>
<Value name="29">
<Value>LegacyPossessionOrder</Value>
</Value>
<Value name="30">
<Value>LegacyDatePossession</Value>
</Value>
<Value name="31">
<Value>LegacyRepossessionSaleValueAchieved</Value>
</Value>
<Value name="32">
<Value>LegacyDateofBalance</Value>
</Value>
<Value name="33">
<Value>LegacySecondChargeMortgage</Value>
</Value>
<Value name="34">
<Value>LegacyBeneficialOwnerRegFirm</Value>
</Value>
<Value name="35">
<Value>LegacyBeneficialOwnerFRN</Value>
</Value>
<Value name="36">
<Value>LegacyBeneficialOwnerName</Value>
</Value>
<Value name="37">
<Value>LegacyLegalOwnerRegFirm</Value>
</Value>
<Value name="38">
<Value>LegacyLegalOwnerFRN</Value>
</Value>
<Value name="39">
<Value>LegacyLegalOwnerName</Value>
</Value>
<Value name="40">
<Value>LegacyClosedBook</Value>
</Value>
<Value name="41">
<Value>%ParentBatch</Value>
</Value>
<Value name="42">
<Value>LegacyFirmId</Value>
</Value>
</Data>
<DataLocation>^Staging.RM.Mortgage9716.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^Staging.RM.Mortgage9716.RecordD</IdLocation>
<IndexLocation>^Staging.RM.Mortgage9716.RecordI</IndexLocation>
<StreamLocation>^Staging.RM.Mortgage9716.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
