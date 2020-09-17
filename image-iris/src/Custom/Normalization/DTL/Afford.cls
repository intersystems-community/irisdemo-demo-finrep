Class Custom.Normalization.DTL.Afford Extends Ens.DataTransformDTL [ DependsOn = (Staging.RM.MortgageAfford.Record, Canonical.MortgageAfford) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Staging.RM.MortgageAfford.Record' targetClass='Canonical.MortgageAfford' create='new' language='objectscript' >
<assign value='##class(Canonical.UtilityFunctions).Mortgage(source.LegacyFirmId,source.LegacyTransId)' property='mortgage' action='set' />
<assign value='##class(Canonical.UtilityFunctions).MortgageAfford(mortgage,$ZDateH(source.LegacyAsOfDate,3))' property='target' action='set' />
<assign value='source.LegacyGrossIncome' property='target.GrossIncome' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTTypeDwelling(source.LegacyDwellingTyp)' property='target.DwellingType' action='set' />
<assign value='source.LegacyNumBedrooms' property='target.NumBedrooms' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRemtgePurpose(source.LegacyRemtgePurpose)' property='target.RemtgePurpose' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTIncomeVerification(source.LegacyIncomeVerification)' property='target.IncomeVerification' action='set' />
<assign value='source.LegacyMtgeProtection' property='target.MtgeProtection' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMainEmpStatus(source.LegacyPrimaryEmpStatus)' property='target.PrimaryEmpStatus' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMainEmpStatus(source.LegacySecondaryEmpStatus)' property='target.SecondaryEmpStatus' action='set' />
<assign value='source.LegacyNumHabitableRooms' property='target.NumHabitableRooms' action='set' />
<assign value='source.LegacyGarage' property='target.HasGarage' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMCOBUsed(source.LegacyMCOBUsed)' property='target.MtgeConductOfBusinessUsed' action='set' />
<assign value='source.LegacyNumBorrowersAssessed' property='target.NumBorrowersAssessed' action='set' />
<assign value='source.LegacyNumDependentAdults' property='target.NumDependentAdults' action='set' />
<assign value='source.LegacyNumDependChildren' property='target.NumDependChildren' action='set' />
<assign value='source.LegacyPrimaryRetireAge' property='target.PrimaryRetireAge' action='set' />
<assign value='source.LegacySecondaryRetireAge' property='target.SecondaryRetireAge' action='set' />
<assign value='source.LegacyPrimaryGrossPay' property='target.PrimaryGrossPay' action='set' />
<assign value='source.LegacyPrimaryGrossOtherIncomeEmploy' property='target.PrimaryGrossOtherIncomeEmploy' action='set' />
<assign value='source.LegacyPrimaryGrossIncomeSelfEmploy' property='target.PrimaryGrossIncomeSelfEmploy' action='set' />
<assign value='source.LegacyPrimaryGrossOtherIncome' property='target.PrimaryGrossOtherIncome' action='set' />
<assign value='source.LegacySecondaryGrossPay' property='target.SecondaryGrossPay' action='set' />
<assign value='source.LegacySecondaryGrossIncomeEmploy' property='target.SecondaryGrossIncomeEmploy' action='set' />
<assign value='source.LegacySecondaryGrossSelfEmploy' property='target.SecondaryGrossSelfEmploy' action='set' />
<assign value='source.LegacySecondaryGrossOtherIncome' property='target.SecondaryGrossOtherIncome' action='set' />
<assign value='source.LegacyTertiaryGrossPay' property='target.TertiaryGrossPay' action='set' />
<assign value='source.LegacyTertiaryGrossIncomeEmploy' property='target.TertiaryGrossIncomeEmploy' action='set' />
<assign value='source.LegacyTertiaryGrossSelfEmploy' property='target.TertiaryGrossSelfEmploy' action='set' />
<assign value='source.LegacyTertiaryGrossOtherIncome' property='target.TertiaryGrossOtherIncome' action='set' />
<assign value='source.LegacyPrimaryTotalVerifiedIncme' property='target.PrimaryTotalVerifiedIncme' action='set' />
<assign value='source.LegacySecondaryTotalVerifiedNetIncome' property='target.SecondaryTotalVerifiedNetIncome' action='set' />
<assign value='source.LegacyTertiaryTotalVerifiedNetIncome' property='target.TertiaryTotalVerifiedNetIncome' action='set' />
<assign value='source.LegacyTotalOutstandingCredits' property='target.TotalOutstandingCredits' action='set' />
<assign value='source.LegacyMonthlyExpenditure' property='target.MonthlyExpenditure' action='set' />
<assign value='source.LegacyBasicExpenditure' property='target.BasicExpenditure' action='set' />
<assign value='source.LegacyStressTestedInterestRate' property='target.StressTestedInterestRate' action='set' />
</transform>
}

}
