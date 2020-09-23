Class Canonical.MortgageAfford Extends Normalization.NormalizedData
{

Property AsOfDate As %Date [ SqlColumnNumber = 2 ];

Property Mortgage As Mortgage [ SqlColumnNumber = 3 ];

Property GrossIncome As %Double [ SqlColumnNumber = 5 ];

Property DwellingType As Canonical.CT.TypeDwelling [ SqlColumnNumber = 6 ];

Property NumBedrooms As %Integer [ SqlColumnNumber = 7 ];

Property RemtgePurpose As Canonical.CT.RemtgePurpose [ SqlColumnNumber = 8 ];

Property IncomeVerification As Canonical.CT.IncomeVerification [ SqlColumnNumber = 9 ];

Property MtgeProtection As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 10 ];

Property PrimaryEmpStatus As Canonical.CT.MainEmpStatus [ SqlColumnNumber = 11 ];

Property SecondaryEmpStatus As Canonical.CT.MainEmpStatus [ SqlColumnNumber = 12 ];

Property NumHabitableRooms As %Integer [ SqlColumnNumber = 13 ];

Property HasGarage As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 14 ];

/// LegacyMCOBUsed
Property MtgeConductOfBusinessUsed As Canonical.CT.MCOBUsed [ SqlColumnNumber = 15 ];

Property NumBorrowersAssessed As %String(DISPLAYLIST = ",1,2,3 or more", VALUELIST = ",1,2,3") [ SqlColumnNumber = 16 ];

Property NumDependentAdults As %Integer [ SqlColumnNumber = 17 ];

Property NumDependChildren As %Integer [ SqlColumnNumber = 18 ];

Property PrimaryRetireAge As %Integer [ SqlColumnNumber = 19 ];

Property SecondaryRetireAge As %Integer [ SqlColumnNumber = 20 ];

Property PrimaryGrossPay As %Double [ SqlColumnNumber = 21 ];

Property PrimaryGrossOtherIncomeEmploy As %Double [ SqlColumnNumber = 22 ];

Property PrimaryGrossIncomeSelfEmploy As %Double [ SqlColumnNumber = 23 ];

Property PrimaryGrossOtherIncome As %Double [ SqlColumnNumber = 24 ];

Property SecondaryGrossPay As %Double [ SqlColumnNumber = 25 ];

Property SecondaryGrossIncomeEmploy As %Double [ SqlColumnNumber = 26 ];

Property SecondaryGrossSelfEmploy As %Double [ SqlColumnNumber = 27 ];

Property SecondaryGrossOtherIncome As %Double [ SqlColumnNumber = 28 ];

Property TertiaryGrossPay As %Double [ SqlColumnNumber = 29 ];

Property TertiaryGrossIncomeEmploy As %Double [ SqlColumnNumber = 30 ];

Property TertiaryGrossSelfEmploy As %Double [ SqlColumnNumber = 31 ];

Property TertiaryGrossOtherIncome As %Double [ SqlColumnNumber = 32 ];

Property PrimaryTotalVerifiedIncme As %Double [ SqlColumnNumber = 33 ];

Property SecondaryTotalVerifiedNetIncome As %Double [ SqlColumnNumber = 34 ];

Property TertiaryTotalVerifiedNetIncome As %Double [ SqlColumnNumber = 35 ];

Property TotalOutstandingCredits As %Double [ SqlColumnNumber = 36 ];

Property MonthlyExpenditure As %Double [ SqlColumnNumber = 37 ];

Property BasicExpenditure As %Double [ SqlColumnNumber = 38 ];

Property StressTestedInterestRate As %Double [ SqlColumnNumber = 39 ];

Index MortgagePerformancePK On (Mortgage, AsOfDate) [ Data = %BatchRecordStatus, PrimaryKey ];

Storage Default
{
<Data name="MortgageAffordDefaultData">
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
<Value>DwellingType</Value>
</Value>
<Value name="6">
<Value>NumBedrooms</Value>
</Value>
<Value name="7">
<Value>RemtgePurpose</Value>
</Value>
<Value name="8">
<Value>IncomeVerification</Value>
</Value>
<Value name="9">
<Value>MtgeProtection</Value>
</Value>
<Value name="10">
<Value>PrimaryEmpStatus</Value>
</Value>
<Value name="11">
<Value>SecondaryEmpStatus</Value>
</Value>
<Value name="12">
<Value>NumHabitableRooms</Value>
</Value>
<Value name="13">
<Value>HasGarage</Value>
</Value>
<Value name="14">
<Value>MtgeConductOfBusinessUsed</Value>
</Value>
<Value name="15">
<Value>NumBorrowersAssessed</Value>
</Value>
<Value name="16">
<Value>NumDependentAdults</Value>
</Value>
<Value name="17">
<Value>NumDependChildren</Value>
</Value>
<Value name="18">
<Value>PrimaryRetireAge</Value>
</Value>
<Value name="19">
<Value>SecondaryRetireAge</Value>
</Value>
<Value name="20">
<Value>PrimaryGrossPay</Value>
</Value>
<Value name="21">
<Value>PrimaryGrossOtherIncomeEmploy</Value>
</Value>
<Value name="22">
<Value>PrimaryGrossIncomeSelfEmploy</Value>
</Value>
<Value name="23">
<Value>PrimaryGrossOtherIncome</Value>
</Value>
<Value name="24">
<Value>SecondaryGrossPay</Value>
</Value>
<Value name="25">
<Value>SecondaryGrossIncomeEmploy</Value>
</Value>
<Value name="26">
<Value>SecondaryGrossSelfEmploy</Value>
</Value>
<Value name="27">
<Value>SecondaryGrossOtherIncome</Value>
</Value>
<Value name="28">
<Value>TertiaryGrossPay</Value>
</Value>
<Value name="29">
<Value>TertiaryGrossIncomeEmploy</Value>
</Value>
<Value name="30">
<Value>TertiaryGrossSelfEmploy</Value>
</Value>
<Value name="31">
<Value>TertiaryGrossOtherIncome</Value>
</Value>
<Value name="32">
<Value>PrimaryTotalVerifiedIncme</Value>
</Value>
<Value name="33">
<Value>SecondaryTotalVerifiedNetIncome</Value>
</Value>
<Value name="34">
<Value>TertiaryTotalVerifiedNetIncome</Value>
</Value>
<Value name="35">
<Value>TotalOutstandingCredits</Value>
</Value>
<Value name="36">
<Value>MonthlyExpenditure</Value>
</Value>
<Value name="37">
<Value>BasicExpenditure</Value>
</Value>
<Value name="38">
<Value>StressTestedInterestRate</Value>
</Value>
<Value name="39">
<Value>AsOfDate</Value>
</Value>
<Value name="40">
<Value>GrossIncome</Value>
</Value>
<Value name="41">
<Value>Mortgage</Value>
</Value>
</Data>
<DataLocation>^Canonical.MortgageAffordD</DataLocation>
<DefaultData>MortgageAffordDefaultData</DefaultData>
<IdLocation>^Canonical.MortgageAffordD</IdLocation>
<IndexLocation>^Canonical.MortgageAffordI</IndexLocation>
<StreamLocation>^Canonical.MortgageAffordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
