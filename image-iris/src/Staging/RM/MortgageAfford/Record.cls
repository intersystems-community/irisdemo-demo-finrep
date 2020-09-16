/// RECORDMAP: Generated from RecordMap 'Staging.RM.MortgageAfford'
/// on 2020-09-14 at 17:41:09.755 [2020-09-14 17:41:09.755 UTC]
/// by user SuperUser
Class Staging.RM.MortgageAfford.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property LegacyAsOfDate As %String [ SqlColumnNumber = 2 ];

Property LegacyFirmId As %String [ SqlColumnNumber = 3 ];

Property LegacyTransId As %String [ SqlColumnNumber = 4 ];

Property LegacyGrossIncome As %String [ SqlColumnNumber = 5 ];

Property LegacyDwellingTyp As %String [ SqlColumnNumber = 6 ];

Property LegacyNumBedrooms As %String [ SqlColumnNumber = 7 ];

Property LegacyRemtgePurpose As %String [ SqlColumnNumber = 8 ];

Property LegacyIncomeVerification As %String [ SqlColumnNumber = 9 ];

Property LegacyMtgeProtection As %String [ SqlColumnNumber = 10 ];

Property LegacyPrimaryEmpStatus As %String [ SqlColumnNumber = 11 ];

Property LegacySecondaryEmpStatus As %String [ SqlColumnNumber = 12 ];

Property LegacyNumHabitableRooms As %String [ SqlColumnNumber = 13 ];

Property LegacyGarage As %String [ SqlColumnNumber = 14 ];

Property LegacyMCOBUsed As %String [ SqlColumnNumber = 15 ];

Property LegacyNumBorrowersAssessed As %String [ SqlColumnNumber = 16 ];

Property LegacyNumDependentAdults As %String [ SqlColumnNumber = 17 ];

Property LegacyNumDependChildren As %String [ SqlColumnNumber = 18 ];

Property LegacyPrimaryRetireAge As %String [ SqlColumnNumber = 19 ];

Property LegacySecondaryRetireAge As %String [ SqlColumnNumber = 20 ];

Property LegacyPrimaryGrossPay As %String [ SqlColumnNumber = 21 ];

Property LegacyPrimaryGrossOtherIncomeEmploy As %String [ SqlColumnNumber = 22 ];

Property LegacyPrimaryGrossIncomeSelfEmploy As %String [ SqlColumnNumber = 23 ];

Property LegacyPrimaryGrossOtherIncome As %String [ SqlColumnNumber = 24 ];

Property LegacySecondaryGrossPay As %String [ SqlColumnNumber = 25 ];

Property LegacySecondaryGrossIncomeEmploy As %String [ SqlColumnNumber = 26 ];

Property LegacySecondaryGrossSelfEmploy As %String [ SqlColumnNumber = 27 ];

Property LegacySecondaryGrossOtherIncome As %String [ SqlColumnNumber = 28 ];

Property LegacyTertiaryGrossPay As %String [ SqlColumnNumber = 29 ];

Property LegacyTertiaryGrossIncomeEmploy As %String [ SqlColumnNumber = 30 ];

Property LegacyTertiaryGrossSelfEmploy As %String [ SqlColumnNumber = 31 ];

Property LegacyTertiaryGrossOtherIncome As %String [ SqlColumnNumber = 32 ];

Property LegacyPrimaryTotalVerifiedIncme As %String [ SqlColumnNumber = 33 ];

Property LegacySecondaryTotalVerifiedNetIncome As %String [ SqlColumnNumber = 34 ];

Property LegacyTertiaryTotalVerifiedNetIncome As %String [ SqlColumnNumber = 35 ];

Property LegacyTotalOutstandingCredits As %String [ SqlColumnNumber = 36 ];

Property LegacyMonthlyExpenditure As %String [ SqlColumnNumber = 37 ];

Property LegacyBasicExpenditure As %String [ SqlColumnNumber = 38 ];

Property LegacyStressTestedInterestRate As %String [ SqlColumnNumber = 39 ];

Parameter RECORDMAPGENERATED = 1;

Relationship %ParentBatch As Staging.RM.MortgageAfford.Batch [ Cardinality = one, Inverse = Records ];

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
<Value>LegacyGrossIncome</Value>
</Value>
<Value name="6">
<Value>LegacyDwellingTyp</Value>
</Value>
<Value name="7">
<Value>LegacyNumBedrooms</Value>
</Value>
<Value name="8">
<Value>LegacyRemtgePurpose</Value>
</Value>
<Value name="9">
<Value>LegacyIncomeVerification</Value>
</Value>
<Value name="10">
<Value>LegacyMtgeProtection</Value>
</Value>
<Value name="11">
<Value>LegacyPrimaryEmpStatus</Value>
</Value>
<Value name="12">
<Value>LegacySecondaryEmpStatus</Value>
</Value>
<Value name="13">
<Value>LegacyNumHabitableRooms</Value>
</Value>
<Value name="14">
<Value>LegacyGarage</Value>
</Value>
<Value name="15">
<Value>LegacyMCOBUsed</Value>
</Value>
<Value name="16">
<Value>LegacyNumBorrowersAssessed</Value>
</Value>
<Value name="17">
<Value>LegacyNumDependentAdults</Value>
</Value>
<Value name="18">
<Value>LegacyNumDependChildren</Value>
</Value>
<Value name="19">
<Value>LegacyPrimaryRetireAge</Value>
</Value>
<Value name="20">
<Value>LegacySecondaryRetireAge</Value>
</Value>
<Value name="21">
<Value>LegacyPrimaryGrossPay</Value>
</Value>
<Value name="22">
<Value>LegacyPrimaryGrossOtherIncomeEmploy</Value>
</Value>
<Value name="23">
<Value>LegacyPrimaryGrossIncomeSelfEmploy</Value>
</Value>
<Value name="24">
<Value>LegacyPrimaryGrossOtherIncome</Value>
</Value>
<Value name="25">
<Value>LegacySecondaryGrossPay</Value>
</Value>
<Value name="26">
<Value>LegacySecondaryGrossIncomeEmploy</Value>
</Value>
<Value name="27">
<Value>LegacySecondaryGrossSelfEmploy</Value>
</Value>
<Value name="28">
<Value>LegacySecondaryGrossOtherIncome</Value>
</Value>
<Value name="29">
<Value>LegacyTertiaryGrossPay</Value>
</Value>
<Value name="30">
<Value>LegacyTertiaryGrossIncomeEmploy</Value>
</Value>
<Value name="31">
<Value>LegacyTertiaryGrossSelfEmploy</Value>
</Value>
<Value name="32">
<Value>LegacyTertiaryGrossOtherIncome</Value>
</Value>
<Value name="33">
<Value>LegacyPrimaryTotalVerifiedIncme</Value>
</Value>
<Value name="34">
<Value>LegacySecondaryTotalVerifiedNetIncome</Value>
</Value>
<Value name="35">
<Value>LegacyTertiaryTotalVerifiedNetIncome</Value>
</Value>
<Value name="36">
<Value>LegacyTotalOutstandingCredits</Value>
</Value>
<Value name="37">
<Value>LegacyMonthlyExpenditure</Value>
</Value>
<Value name="38">
<Value>LegacyBasicExpenditure</Value>
</Value>
<Value name="39">
<Value>LegacyStressTestedInterestRate</Value>
</Value>
<Value name="40">
<Value>%ParentBatch</Value>
</Value>
<Value name="41">
<Value>LegacyFirmId</Value>
</Value>
</Data>
<DataLocation>^Staging.RM.Mortgage36F8.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^Staging.RM.Mortgage36F8.RecordD</IdLocation>
<IndexLocation>^Staging.RM.Mortgage36F8.RecordI</IndexLocation>
<StreamLocation>^Staging.RM.Mortgage36F8.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
