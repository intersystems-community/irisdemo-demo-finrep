Class Custom.FCAReport.DTL.PSD001.Msg Extends Ens.DataTransformDTL [ DependsOn = (Canonical.Mortgage, FCA.PSD001.FSAHSFFeedMG) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Canonical.Mortgage' targetClass='FCA.PSD001.FSAHSFFeedMG' create='existing' language='objectscript' >
<assign value='source.TransactionId' property='target.FSAHSFFeedMGMsg.(aux).CoreItems.TransRef' action='set' />
<assign value='source.FirmId' property='target.FSAHSFFeedMGMsg.(aux).CoreItems.FirmFSARef' action='set' />
<assign value='source.AcctOpenDate' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.AcctOpenDate' action='set' />
<assign value='source.AdvisedSale' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.AdvisedSale' action='set' />
<assign value='source.IntRateType.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.TypeIntRate' action='set' />
<if condition='source.MtgeType1' >
<true>
<assign value='source.MtgeType1.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeTypeList' action='append' />
</true>
</if>
<if condition='source.MtgeType2' >
<true>
<assign value='source.MtgeType2.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeTypeList' action='append' />
</true>
</if>
<if condition='source.MtgeType3' >
<true>
<assign value='source.MtgeType3.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeTypeList' action='append' />
</true>
</if>
<if condition='source.MtgeType4' >
<true>
<assign value='source.MtgeType4.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeTypeList' action='append' />
</true>
</if>
<if condition='source.MtgeType5' >
<true>
<assign value='source.MtgeType5.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeTypeList' action='append' />
</true>
</if>
<if condition='source.MtgeType6' >
<true>
<assign value='source.MtgeType6.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeTypeList' action='append' />
</true>
</if>
<if condition='source.MtgeType7' >
<true>
<assign value='source.MtgeType7.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeTypeList' action='append' />
</true>
</if>
<if condition='source.MtgeType8' >
<true>
<assign value='source.MtgeType8.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeTypeList' action='append' />
</true>
</if>
<if condition='source.MtgeType9' >
<true>
<assign value='source.MtgeType9.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeTypeList' action='append' />
</true>
</if>
<if condition='source.MtgeType10' >
<true>
<assign value='source.MtgeType10.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeTypeList' action='append' />
</true>
</if>
<if condition='source.MtgeType11' >
<true>
<assign value='source.MtgeType11.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeTypeList' action='append' />
</true>
</if>
<if condition='source.MtgeCharacteristic1' >
<true>
<assign value='source.MtgeCharacteristic1.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeCharsList' action='append' />
</true>
</if>
<if condition='source.MtgeCharacteristic2' >
<true>
<assign value='source.MtgeCharacteristic2.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeCharsList' action='append' />
</true>
</if>
<if condition='source.MtgeCharacteristic3' >
<true>
<assign value='source.MtgeCharacteristic3.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeCharsList' action='append' />
</true>
</if>
<if condition='source.MtgeCharacteristic4' >
<true>
<assign value='source.MtgeCharacteristic4.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeCharsList' action='append' />
</true>
</if>
<if condition='source.MtgeCharacteristic5' >
<true>
<assign value='source.MtgeCharacteristic5.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeCharsList' action='append' />
</true>
</if>
<assign value='source.PropertyPostCode' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.PropertyPostCode' action='set' />
<assign value='source.BorrowerType.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.TypeBorrower' action='set' />
<assign value='source.RepayMethod.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.RepayMethod' action='set' />
<assign value='source.MtgeTerm' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeTerm' action='set' />
<assign value='source.LoanAmt' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.LoanAmt' action='set' />
<assign value='source.PropertyValue' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.PropertyValue' action='set' />
<assign value='source.IncomeBasisType.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.IncomeBasis' action='set' />
<assign value='source.PrimaryDateOfBirth' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MainDOB' action='set' />
<assign value='source.Affordability.IncomeVerification.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.IncomeVerification' action='set' />
<assign value='source.Affordability.PrimaryEmpStatus.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MainEmpStatus' action='set' />
<assign value='source.Affordability.GrossIncome' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.GrossIncome' action='set' />
<assign value='source.PrimaryBorrowerCCJValue' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MainBorrowerCCJValue' action='set' />
<assign value='source.SecondaryBorrowerCCJValue' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.SecondBorrowerCCJValue' action='set' />
<if condition='source.PrimaryBorrowerCrdHist1' >
<true>
<assign value='source.PrimaryBorrowerCrdHist1.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MainBorrowerImpCredHistList' action='append' />
</true>
</if>
<if condition='source.PrimaryBorrowerCrdHist2' >
<true>
<assign value='source.PrimaryBorrowerCrdHist2.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MainBorrowerImpCredHistList' action='append' />
</true>
</if>
<if condition='source.PrimaryBorrowerCrdHist3' >
<true>
<assign value='source.PrimaryBorrowerCrdHist3.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MainBorrowerImpCredHistList' action='append' />
</true>
</if>
<if condition='source.PrimaryBorrowerCrdHist4' >
<true>
<assign value='source.PrimaryBorrowerCrdHist4.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MainBorrowerImpCredHistList' action='append' />
</true>
</if>
<if condition='source.SecondaryBorrowerCrdHist1' >
<true>
<assign value='source.SecondaryBorrowerCrdHist1.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.SecondBorrowerImpCredHistList' action='append' />
</true>
</if>
<if condition='source.SecondaryBorrowerCrdHist2' >
<true>
<assign value='source.SecondaryBorrowerCrdHist2.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.SecondBorrowerImpCredHistList' action='append' />
</true>
</if>
<if condition='source.SecondaryBorrowerCrdHist3' >
<true>
<assign value='source.SecondaryBorrowerCrdHist3.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.SecondBorrowerImpCredHistList' action='append' />
</true>
</if>
<if condition='source.SecondaryBorrowerCrdHist4' >
<true>
<assign value='source.SecondaryBorrowerCrdHist4.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.SecondBorrowerImpCredHistList' action='append' />
</true>
</if>
<assign value='source.InitialGrossIntRate' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.InitialGrossIntRate' action='set' />
<assign value='source.IncentiveRateEndDate' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.DateIncentiveRateEnds' action='set' />
<assign value='source.ERCEndDate' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.DateERCEnds' action='set' />
<assign value='source.PurchasePrice' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.PurchasePrice' action='set' />
<assign value='source.Affordability.DwellingType.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.TypeDwelling' action='set' />
<assign value='source.Affordability.NumBedrooms' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.NumBedrooms' action='set' />
<assign value='source.Affordability.NumHabitableRooms' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.NumHabitableRooms' action='set' />
<if condition='source.RemtgePurpose1' >
<true>
<assign value='source.RemtgePurpose1.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.RemtgePurposeList' action='append' />
</true>
</if>
<if condition='source.RemtgePurpose2' >
<true>
<assign value='source.RemtgePurpose2.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.RemtgePurposeList' action='append' />
</true>
</if>
<if condition='source.RemtgePurpose3' >
<true>
<assign value='source.RemtgePurpose3.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.RemtgePurposeList' action='append' />
</true>
</if>
<assign value='source.HowSaleMade.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.HowSaleMade' action='set' />
<assign value='source.ReversionRateType.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.TypeReversionRate' action='set' />
<assign value='$Case(source.GovtInitiative,"Y":"yes","N":"no",:"")' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.GovernmentInitiative' action='set' />
<if condition='source.RepayStrat1' >
<true>
<assign value='source.RepayStrat1.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.RepaymentStrategyList' action='append' />
</true>
</if>
<if condition='source.RepayStrat2' >
<true>
<assign value='source.RepayStrat2.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.RepaymentStrategyList' action='append' />
</true>
</if>
<if condition='source.RepayStrat3' >
<true>
<assign value='source.RepayStrat3.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.RepaymentStrategyList' action='append' />
</true>
</if>
<if condition='source.RepayStrat4' >
<true>
<assign value='source.RepayStrat4.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.RepaymentStrategyList' action='append' />
</true>
</if>
<if condition='source.RepayStrat5' >
<true>
<assign value='source.RepayStrat5.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.RepaymentStrategyList' action='append' />
</true>
</if>
<if condition='source.RepayStrat6' >
<true>
<assign value='source.RepayStrat6.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.RepaymentStrategyList' action='append' />
</true>
</if>
<if condition='source.RepayStrat7' >
<true>
<assign value='source.RepayStrat7.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.RepaymentStrategyList' action='append' />
</true>
</if>
<if condition='source.RepayStrat8' >
<true>
<assign value='source.RepayStrat8.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.RepaymentStrategyList' action='append' />
</true>
</if>
<if condition='source.RepayStrat9' >
<true>
<assign value='source.RepayStrat9.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.RepaymentStrategyList' action='append' />
</true>
</if>
<if condition='source.RepayStrat10' >
<true>
<assign value='source.RepayStrat10.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.RepaymentStrategyList' action='append' />
</true>
</if>
<if condition='source.RepayStrat11' >
<true>
<assign value='source.RepayStrat11.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.RepaymentStrategyList' action='append' />
</true>
</if>
<assign value='source.PercentageIO' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.PercentageIO' action='set' />
<assign value='$Case(source.InterestRollUp,"Y":"yes","N":"no",:"")' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.InterestRollUp' action='set' />
<assign value='source.ValuationType.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.ValuationType' action='set' />
<assign value='source.SecondaryDateOfBirth' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.SecondDOB' action='set' />
<assign value='source.MoneyWithdrawn' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MoneyWithdrawn' action='set' />
<assign value='source.DebtConsolidationAmt' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.AmountDebtCons' action='set' />
<assign value='$Case(source.EarlyRepaymentCharge,"Y":"yes","N":"no",:"")' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.EarlyRepaymentCharge' action='set' />
<assign value='source.NewDwelling' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.NewDwelling' action='set' />
<assign value='source.Affordability.HasGarage' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.GarageInc' action='set' />
<assign value='source.Affordability.MtgeProtection' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MtgeProtectionPlanInc' action='set' />
<assign value='source.Currency' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.Currency' action='set' />
<assign value='source.CustomerPct' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.CustomersShare' action='set' />
<assign value='source.TotalLoanAvailable' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.TotalLoanAvailable' action='set' />
<assign value='source.LenderFee' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.LenderFees' action='set' />
<assign value='source.IntermediaryFee' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.IntermediaryFees' action='set' />
<assign value='source.TotalFeesCharges' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.FeesChargesAdded' action='set' />
<assign value='source.ProcurationFee' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.ProcurationFee' action='set' />
<assign value='source.Affordability.NumBorrowersAssessed' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.NumberAssessed' action='set' />
<assign value='source.Affordability.NumDependentAdults' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.DependentAdults' action='set' />
<assign value='source.Affordability.NumDependChildren' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.DependentChildren' action='set' />
<assign value='source.Affordability.SecondaryEmpStatus.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.SecondEmpStatus' action='set' />
<assign value='source.Affordability.PrimaryRetireAge' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MainRetirementAge' action='set' />
<assign value='source.Affordability.SecondaryRetireAge' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.SecondRetirementAge' action='set' />
<assign value='source.Affordability.PrimaryGrossPay' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MainGrossBasicPay' action='set' />
<assign value='source.Affordability.PrimaryGrossOtherIncomeEmploy' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MainGrossOtherIncomeEmployment' action='set' />
<assign value='source.Affordability.PrimaryGrossIncomeSelfEmploy' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MainGrossIncomeSelfEmployment' action='set' />
<assign value='source.Affordability.PrimaryGrossOtherIncome' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MainGrossOtherIncome' action='set' />
<assign value='source.Affordability.SecondaryGrossPay' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.SecondGrossBasicPay' action='set' />
<assign value='source.Affordability.SecondaryGrossIncomeEmploy' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.SecondGrossOtherIncomeEmployment' action='set' />
<assign value='source.Affordability.SecondaryGrossSelfEmploy' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.SecondGrossIncomeSelfEmployment' action='set' />
<assign value='source.Affordability.SecondaryGrossOtherIncome' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.SecondGrossOtherIncome' action='set' />
<assign value='source.Affordability.TertiaryGrossPay' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.ThirdGrossBasicPay' action='set' />
<assign value='source.Affordability.TertiaryGrossIncomeEmploy' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.ThirdGrossOtherIncomeEmployment' action='set' />
<assign value='source.Affordability.TertiaryGrossSelfEmploy' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.ThirdGrossIncomeSelfEmployment' action='set' />
<assign value='source.Affordability.TertiaryGrossOtherIncome' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.ThirdGrossOtherIncome' action='set' />
<assign value='source.Affordability.PrimaryTotalVerifiedIncme' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MainTotalVerifiedNetIncome' action='set' />
<assign value='source.Affordability.SecondaryTotalVerifiedNetIncome' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.SecondTotalVerifiedNetIncome' action='set' />
<assign value='source.Affordability.TertiaryTotalVerifiedNetIncome' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.ThirdTotalVerifiedNetIncome' action='set' />
<assign value='source.Affordability.TotalOutstandingCredits' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.TotalOutstandingCredits' action='set' />
<assign value='source.Affordability.MonthlyExpenditure' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MonthlyExpenditure' action='set' />
<assign value='source.Affordability.BasicExpenditure' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.BasicExpenditure' action='set' />
<assign value='source.Affordability.StressTestedInterestRate' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.StressTestedInterestRate' action='set' />
<assign value='source.Affordability.MtgeConductOfBusinessUsed.Code' property='target.FSAHSFFeedMGMsg.(aux).Mortgage.MCOBUsed' action='set' />
</transform>
}

}
