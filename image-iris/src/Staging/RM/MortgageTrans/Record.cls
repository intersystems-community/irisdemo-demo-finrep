/// RECORDMAP: Generated from RecordMap 'Staging.RM.MortgageTrans'
/// on 2020-09-14 at 17:42:22.261 [2020-09-14 17:42:22.261 UTC]
/// by user SuperUser
Class Staging.RM.MortgageTrans.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property LegacyAsOfDate As %String [ SqlColumnNumber = 2 ];

Property LegacyFirmId As %String [ SqlColumnNumber = 3 ];

Property LegacyTransId As %String [ SqlColumnNumber = 4 ];

Property LegacyAcctOpen As %String [ SqlColumnNumber = 5 ];

Property LegacyBorrowerType As %String [ SqlColumnNumber = 6 ];

Property LegacyLoanAmt As %String [ SqlColumnNumber = 7 ];

Property LegacyPrimaryDOB As %String [ SqlColumnNumber = 8 ];

Property LegacySecondaryDOB As %String [ SqlColumnNumber = 9 ];

Property LegacyPrimaryBorrowerCCJValue As %String [ SqlColumnNumber = 10 ];

Property LegacySecondaryBorrowerCCJValue As %String [ SqlColumnNumber = 11 ];

Property LegacyInitialGrossIntRate As %String [ SqlColumnNumber = 12 ];

Property LegacyPrincipalOrNetworkFirmId As %String [ SqlColumnNumber = 13 ];

Property LegacyMtgeCharacteristic1 As %String [ SqlColumnNumber = 14 ];

Property LegacyMtgeCharacteristic2 As %String [ SqlColumnNumber = 15 ];

Property LegacyMtgeCharacteristic3 As %String [ SqlColumnNumber = 16 ];

Property LegacyMtgeCharacteristic4 As %String [ SqlColumnNumber = 17 ];

Property LegacyMtgeCharacteristic5 As %String [ SqlColumnNumber = 18 ];

Property LegacyIntRateType As %String [ SqlColumnNumber = 19 ];

Property LegacyPropertyValue As %String [ SqlColumnNumber = 20 ];

Property LegacyPrimaryBorrowerCrdHist1 As %String [ SqlColumnNumber = 21 ];

Property LegacyPrimaryBorrowerCrdHist2 As %String [ SqlColumnNumber = 22 ];

Property LegacyPrimaryBorrowerCrdHist3 As %String [ SqlColumnNumber = 23 ];

Property LegacyPrimaryBorrowerCrdHist4 As %String [ SqlColumnNumber = 24 ];

Property LegacySecondaryBorrowerCrdHist1 As %String [ SqlColumnNumber = 25 ];

Property LegacySecondaryBorrowerCrdHist2 As %String [ SqlColumnNumber = 26 ];

Property LegacySecondaryBorrowerCrdHist3 As %String [ SqlColumnNumber = 27 ];

Property LegacySecondaryBorrowerCrdHist4 As %String [ SqlColumnNumber = 28 ];

Property LegacyIncentiveRateEndDate As %String [ SqlColumnNumber = 29 ];

Property LegacyNewDwelling As %String [ SqlColumnNumber = 30 ];

Property LegacyAdvisedSale As %String [ SqlColumnNumber = 31 ];

Property LegacyPropertyPostCode As %String [ SqlColumnNumber = 32 ];

Property LegacyMtgeTerm As %String [ SqlColumnNumber = 33 ];

Property LegacyPurchasePrice As %String [ SqlColumnNumber = 34 ];

Property LegacyIncomeBasis As %String [ SqlColumnNumber = 35 ];

Property LegacyERCEndDate As %String [ SqlColumnNumber = 36 ];

Property LegacyHowSaleMade As %String [ SqlColumnNumber = 37 ];

Property LegacyReversionRateType As %String [ SqlColumnNumber = 38 ];

Property LegacyGovtInitiative As %String [ SqlColumnNumber = 39 ];

Property LegacyRepayMethod As %String [ SqlColumnNumber = 40 ];

Property LegacyRepayStrat1 As %String [ SqlColumnNumber = 41 ];

Property LegacyRepayStrat2 As %String [ SqlColumnNumber = 42 ];

Property LegacyRepayStrat3 As %String [ SqlColumnNumber = 43 ];

Property LegacyRepayStrat4 As %String [ SqlColumnNumber = 44 ];

Property LegacyRepayStrat5 As %String [ SqlColumnNumber = 45 ];

Property LegacyRepayStrat6 As %String [ SqlColumnNumber = 46 ];

Property LegacyRepayStrat7 As %String [ SqlColumnNumber = 47 ];

Property LegacyRepayStrat8 As %String [ SqlColumnNumber = 48 ];

Property LegacyRepayStrat9 As %String [ SqlColumnNumber = 49 ];

Property LegacyRepayStrat10 As %String [ SqlColumnNumber = 50 ];

Property LegacyRepayStrat11 As %String [ SqlColumnNumber = 51 ];

Property LegacyPercentageIO As %String [ SqlColumnNumber = 52 ];

Property LegacyInterestRollUp As %String [ SqlColumnNumber = 53 ];

Property LegacyValuationType As %String [ SqlColumnNumber = 54 ];

Property LegacyMoneyWithdrawn As %String [ SqlColumnNumber = 55 ];

Property LegacyDebtConsolidationAmt As %String [ SqlColumnNumber = 56 ];

Property LegacyEarlyRepaymentCharge As %String [ SqlColumnNumber = 57 ];

Property LegacyCurrency As %String [ SqlColumnNumber = 58 ];

Property LegacyCustomerPct As %String [ SqlColumnNumber = 59 ];

Property LegacyTotalLoanAvailable As %String [ SqlColumnNumber = 60 ];

Property LegacyLenderFee As %String [ SqlColumnNumber = 61 ];

Property LegacyIntermediaryFee As %String [ SqlColumnNumber = 62 ];

Property LegacyProcurationFee As %String [ SqlColumnNumber = 63 ];

Property LegacyTotalFeesCharges As %String [ SqlColumnNumber = 64 ];

Property LegacyMtgeType1 As %String [ SqlColumnNumber = 65 ];

Property LegacyMtgeType2 As %String [ SqlColumnNumber = 66 ];

Property LegacyMtgeType3 As %String [ SqlColumnNumber = 67 ];

Property LegacyMtgeType4 As %String [ SqlColumnNumber = 68 ];

Property LegacyMtgeType5 As %String [ SqlColumnNumber = 69 ];

Property LegacyMtgeType6 As %String [ SqlColumnNumber = 70 ];

Property LegacyMtgeType7 As %String [ SqlColumnNumber = 71 ];

Property LegacyMtgeType8 As %String [ SqlColumnNumber = 72 ];

Property LegacyMtgeType9 As %String [ SqlColumnNumber = 73 ];

Property LegacyMtgeType10 As %String [ SqlColumnNumber = 74 ];

Property LegacyMtgeType11 As %String [ SqlColumnNumber = 75 ];

Property LegacyRemtgePurpose1 As %String [ SqlColumnNumber = 76 ];

Property LegacyRemtgePurpose2 As %String [ SqlColumnNumber = 77 ];

Property LegacyRemtgePurpose3 As %String [ SqlColumnNumber = 78 ];

Parameter RECORDMAPGENERATED = 1;

Relationship %ParentBatch As Staging.RM.MortgageTrans.Batch [ Cardinality = one, Inverse = Records ];

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
<Value>LegacyTransId</Value>
</Value>
<Value name="5">
<Value>LegacyAcctOpen</Value>
</Value>
<Value name="6">
<Value>LegacyBorrowerType</Value>
</Value>
<Value name="7">
<Value>LegacyLoanAmt</Value>
</Value>
<Value name="8">
<Value>LegacyPrimaryDOB</Value>
</Value>
<Value name="9">
<Value>LegacySecondaryDOB</Value>
</Value>
<Value name="10">
<Value>LegacyPrimaryBorrowerCCJValue</Value>
</Value>
<Value name="11">
<Value>LegacySecondaryBorrowerCCJValue</Value>
</Value>
<Value name="12">
<Value>LegacyInitialGrossIntRate</Value>
</Value>
<Value name="13">
<Value>LegacyPrincipalOrNetworkFirmId</Value>
</Value>
<Value name="14">
<Value>LegacyMtgeCharacteristic1</Value>
</Value>
<Value name="15">
<Value>LegacyMtgeCharacteristic2</Value>
</Value>
<Value name="16">
<Value>LegacyMtgeCharacteristic3</Value>
</Value>
<Value name="17">
<Value>LegacyMtgeCharacteristic4</Value>
</Value>
<Value name="18">
<Value>LegacyMtgeCharacteristic5</Value>
</Value>
<Value name="19">
<Value>LegacyIntRateType</Value>
</Value>
<Value name="20">
<Value>LegacyPropertyValue</Value>
</Value>
<Value name="21">
<Value>LegacyPrimaryBorrowerCrdHist1</Value>
</Value>
<Value name="22">
<Value>LegacyPrimaryBorrowerCrdHist2</Value>
</Value>
<Value name="23">
<Value>LegacyPrimaryBorrowerCrdHist3</Value>
</Value>
<Value name="24">
<Value>LegacyPrimaryBorrowerCrdHist4</Value>
</Value>
<Value name="25">
<Value>LegacySecondaryBorrowerCrdHist1</Value>
</Value>
<Value name="26">
<Value>LegacySecondaryBorrowerCrdHist2</Value>
</Value>
<Value name="27">
<Value>LegacySecondaryBorrowerCrdHist3</Value>
</Value>
<Value name="28">
<Value>LegacySecondaryBorrowerCrdHist4</Value>
</Value>
<Value name="29">
<Value>LegacyIncentiveRateEndDate</Value>
</Value>
<Value name="30">
<Value>LegacyNewDwelling</Value>
</Value>
<Value name="31">
<Value>LegacyAdvisedSale</Value>
</Value>
<Value name="32">
<Value>LegacyPropertyPostCode</Value>
</Value>
<Value name="33">
<Value>LegacyMtgeTerm</Value>
</Value>
<Value name="34">
<Value>LegacyPurchasePrice</Value>
</Value>
<Value name="35">
<Value>LegacyIncomeBasis</Value>
</Value>
<Value name="36">
<Value>LegacyERCEndDate</Value>
</Value>
<Value name="37">
<Value>LegacyHowSaleMade</Value>
</Value>
<Value name="38">
<Value>LegacyReversionRateType</Value>
</Value>
<Value name="39">
<Value>LegacyGovtInitiative</Value>
</Value>
<Value name="40">
<Value>LegacyRepayMethod</Value>
</Value>
<Value name="41">
<Value>LegacyRepayStrat1</Value>
</Value>
<Value name="42">
<Value>LegacyRepayStrat2</Value>
</Value>
<Value name="43">
<Value>LegacyRepayStrat3</Value>
</Value>
<Value name="44">
<Value>LegacyRepayStrat4</Value>
</Value>
<Value name="45">
<Value>LegacyRepayStrat5</Value>
</Value>
<Value name="46">
<Value>LegacyRepayStrat6</Value>
</Value>
<Value name="47">
<Value>LegacyRepayStrat7</Value>
</Value>
<Value name="48">
<Value>LegacyRepayStrat8</Value>
</Value>
<Value name="49">
<Value>LegacyRepayStrat9</Value>
</Value>
<Value name="50">
<Value>LegacyRepayStrat10</Value>
</Value>
<Value name="51">
<Value>LegacyRepayStrat11</Value>
</Value>
<Value name="52">
<Value>LegacyPercentageIO</Value>
</Value>
<Value name="53">
<Value>LegacyInterestRollUp</Value>
</Value>
<Value name="54">
<Value>LegacyValuationType</Value>
</Value>
<Value name="55">
<Value>LegacyMoneyWithdrawn</Value>
</Value>
<Value name="56">
<Value>LegacyDebtConsolidationAmt</Value>
</Value>
<Value name="57">
<Value>LegacyEarlyRepaymentCharge</Value>
</Value>
<Value name="58">
<Value>LegacyCurrency</Value>
</Value>
<Value name="59">
<Value>LegacyCustomerPct</Value>
</Value>
<Value name="60">
<Value>LegacyTotalLoanAvailable</Value>
</Value>
<Value name="61">
<Value>LegacyLenderFee</Value>
</Value>
<Value name="62">
<Value>LegacyIntermediaryFee</Value>
</Value>
<Value name="63">
<Value>LegacyProcurationFee</Value>
</Value>
<Value name="64">
<Value>LegacyTotalFeesCharges</Value>
</Value>
<Value name="65">
<Value>LegacyMtgeType1</Value>
</Value>
<Value name="66">
<Value>LegacyMtgeType2</Value>
</Value>
<Value name="67">
<Value>LegacyMtgeType3</Value>
</Value>
<Value name="68">
<Value>LegacyMtgeType4</Value>
</Value>
<Value name="69">
<Value>LegacyMtgeType5</Value>
</Value>
<Value name="70">
<Value>LegacyMtgeType6</Value>
</Value>
<Value name="71">
<Value>LegacyMtgeType7</Value>
</Value>
<Value name="72">
<Value>LegacyMtgeType8</Value>
</Value>
<Value name="73">
<Value>LegacyMtgeType9</Value>
</Value>
<Value name="74">
<Value>LegacyMtgeType10</Value>
</Value>
<Value name="75">
<Value>LegacyMtgeType11</Value>
</Value>
<Value name="76">
<Value>LegacyRemtgePurpose1</Value>
</Value>
<Value name="77">
<Value>LegacyRemtgePurpose2</Value>
</Value>
<Value name="78">
<Value>LegacyRemtgePurpose3</Value>
</Value>
<Value name="79">
<Value>%ParentBatch</Value>
</Value>
<Value name="80">
<Value>LegacyFirmId</Value>
</Value>
</Data>
<DataLocation>^Staging.RM.Mortgage5A55.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^Staging.RM.Mortgage5A55.RecordD</IdLocation>
<IndexLocation>^Staging.RM.Mortgage5A55.RecordI</IndexLocation>
<StreamLocation>^Staging.RM.Mortgage5A55.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
