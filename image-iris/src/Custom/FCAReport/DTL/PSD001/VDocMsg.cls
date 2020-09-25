Class Custom.FCAReport.DTL.PSD001.VDocMsg Extends Ens.DataTransformDTL [ DependsOn = (Canonical.Mortgage, EnsLib.EDI.XML.Document) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Canonical.Mortgage' targetClass='EnsLib.EDI.XML.Document' targetDocType='psd001-schema-v2-2:FSAHSFFeedMG' create='existing' language='objectscript' >
<assign value='source.FirmId' property='target.{FSAHSFFeedMGMsg(aux).CoreItems.FirmFSARef}' action='set' key='aux' />
<assign value='source.TransactionId' property='target.{FSAHSFFeedMGMsg(aux).CoreItems.TransRef}' action='set' key='aux' />
<assign value='$ZDate(source.AcctOpenDate,3)' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.AcctOpenDate}' action='set' key='aux' />
<assign value='source.AdvisedSale' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.AdvisedSale}' action='set' key='aux' />
<assign value='source.IntRateType.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.TypeIntRate}' action='set' key='aux' />
<if condition='source.MtgeType1' >
<true>
<assign value='source.MtgeType1.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MortgageType()}' action='set' key='$I(mortgageType)' />
</true>
</if>
<if condition='source.MtgeType2' >
<true>
<assign value='source.MtgeType2.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MortgageType()}' action='set' key='$I(mortgageType)' />
</true>
</if>
<if condition='source.MtgeType3' >
<true>
<assign value='source.MtgeType3.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MortgageType()}' action='set' key='$I(mortgageType)' />
</true>
</if>
<if condition='source.MtgeType4' >
<true>
<assign value='source.MtgeType4.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MortgageType()}' action='set' key='$I(mortgageType)' />
</true>
</if>
<if condition='source.MtgeType5' >
<true>
<assign value='source.MtgeType5.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MortgageType()}' action='set' key='$I(mortgageType)' />
</true>
</if>
<if condition='source.MtgeType6' >
<true>
<assign value='source.MtgeType6.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MortgageType()}' action='set' key='$I(mortgageType)' />
</true>
</if>
<if condition='source.MtgeType7' >
<true>
<assign value='source.MtgeType7.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MortgageType()}' action='set' key='$I(mortgageType)' />
</true>
</if>
<if condition='source.MtgeType8' >
<true>
<assign value='source.MtgeType8.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MortgageType()}' action='set' key='$I(mortgageType)' />
</true>
</if>
<if condition='source.MtgeType9' >
<true>
<assign value='source.MtgeType9.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MortgageType()}' action='set' key='$I(mortgageType)' />
</true>
</if>
<if condition='source.MtgeType10' >
<true>
<assign value='source.MtgeType10.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MortgageType()}' action='set' key='$I(mortgageType)' />
</true>
</if>
<if condition='source.MtgeType11' >
<true>
<assign value='source.MtgeType11.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MortgageType()}' action='set' key='$I(mortgageType)' />
</true>
</if>
<if condition='source.MtgeCharacteristic1' >
<true>
<assign value='source.MtgeCharacteristic1.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MtgeChar()}' action='set' key='$I(mortgageChar)' />
</true>
</if>
<if condition='source.MtgeCharacteristic2' >
<true>
<assign value='source.MtgeCharacteristic2.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MtgeChar()}' action='set' key='$I(mortgageChar)' />
</true>
</if>
<if condition='source.MtgeCharacteristic3' >
<true>
<assign value='source.MtgeCharacteristic3.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MtgeChar()}' action='set' key='$I(mortgageChar)' />
</true>
</if>
<if condition='source.MtgeCharacteristic4' >
<true>
<assign value='source.MtgeCharacteristic4.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MtgeChar()}' action='set' key='$I(mortgageChar)' />
</true>
</if>
<if condition='source.MtgeCharacteristic5' >
<true>
<assign value='source.MtgeCharacteristic5.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MtgeChar()}' action='set' key='$I(mortgageChar)' />
</true>
</if>
<assign value='source.PropertyPostCode' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.PropertyPostCode}' action='set' key='aux' />
<assign value='source.BorrowerType.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.TypeBorrower}' action='set' key='aux' />
<assign value='source.RepayMethod.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.RepayMethod}' action='set' key='aux' />
<assign value='source.MtgeTerm' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MtgeTerm}' action='set' key='aux' />
<assign value='source.LoanAmt' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.LoanAmt}' action='set' key='aux' />
<assign value='source.PropertyValue' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.PropertyValue}' action='set' key='aux' />
<assign value='source.IncomeBasisType.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.IncomeBasis}' action='set' key='aux' />
<assign value='$ZDate(source.PrimaryDateOfBirth,3)' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MainDOB}' action='set' key='aux' />
<assign value='source.Affordability.IncomeVerification.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.IncomeVerification}' action='set' key='aux' />
<assign value='source.Affordability.PrimaryEmpStatus.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MainEmpStatus}' action='set' key='aux' />
<assign value='source.Affordability.GrossIncome' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.GrossIncome}' action='set' key='aux' />
<assign value='source.PrimaryBorrowerCCJValue' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MainBorrowerCCJValue}' action='set' key='aux' />
<assign value='source.SecondaryBorrowerCCJValue' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.SecondBorrowerCCJValue}' action='set' key='aux' />
<if condition='source.PrimaryBorrowerCrdHist1' >
<true>
<assign value='source.PrimaryBorrowerCrdHist1.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MainBorrowerImpCredHist()}' action='set' key='$I(mortgageCredHist)' />
</true>
</if>
<if condition='source.PrimaryBorrowerCrdHist2' >
<true>
<assign value='source.PrimaryBorrowerCrdHist2.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MainBorrowerImpCredHist()}' action='set' key='$I(mortgageCredHist)' />
</true>
</if>
<if condition='source.PrimaryBorrowerCrdHist3' >
<true>
<assign value='source.PrimaryBorrowerCrdHist3.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MainBorrowerImpCredHist()}' action='set' key='$I(mortgageCredHist)' />
</true>
</if>
<if condition='source.PrimaryBorrowerCrdHist4' >
<true>
<assign value='source.PrimaryBorrowerCrdHist4.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MainBorrowerImpCredHist()}' action='set' key='$I(mortgageCredHist)' />
</true>
</if>
<if condition='source.SecondaryBorrowerCrdHist1' >
<true>
<assign value='source.SecondaryBorrowerCrdHist1.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.SecondBorrowerImpCredHist()}' action='set' key='$I(mortgageCredHistSec)' />
</true>
</if>
<if condition='source.SecondaryBorrowerCrdHist2' >
<true>
<assign value='source.SecondaryBorrowerCrdHist2.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.SecondBorrowerImpCredHist()}' action='set' key='$I(mortgageCredHistSec)' />
</true>
</if>
<if condition='source.SecondaryBorrowerCrdHist3' >
<true>
<assign value='source.SecondaryBorrowerCrdHist3.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.SecondBorrowerImpCredHist()}' action='set' key='$I(mortgageCredHistSec)' />
</true>
</if>
<if condition='source.SecondaryBorrowerCrdHist4' >
<true>
<assign value='source.SecondaryBorrowerCrdHist4.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.SecondBorrowerImpCredHist()}' action='set' key='$I(mortgageCredHistSec)' />
</true>
</if>
<assign value='source.InitialGrossIntRate' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.InitialGrossIntRate}' action='set' key='aux' />
<assign value='$ZDate(source.IncentiveRateEndDate,3)' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.DateIncentiveRateEnds}' action='set' key='aux' />
<assign value='$ZDate(source.ERCEndDate,3)' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.DateERCEnds}' action='set' key='aux' />
<assign value='source.PurchasePrice' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.PurchasePrice}' action='set' key='aux' />
<assign value='source.Affordability.DwellingType.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.TypeDwelling}' action='set' key='aux' />
<assign value='source.Affordability.NumBedrooms' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.NumBedrooms}' action='set' key='aux' />
<assign value='source.Affordability.NumHabitableRooms' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.NumHabitableRooms}' action='set' key='aux' />
<if condition='source.RemtgePurpose1' >
<true>
<assign value='source.RemtgePurpose1.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.RemtgePurpose_2()}' action='set' key='$I(remtgePurp)' />
</true>
</if>
<if condition='source.RemtgePurpose2' >
<true>
<assign value='source.RemtgePurpose2.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.RemtgePurpose_2()}' action='set' key='$I(remtgePurp)' />
</true>
</if>
<if condition='source.RemtgePurpose3' >
<true>
<assign value='source.RemtgePurpose3.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.RemtgePurpose_2()}' action='set' key='$I(remtgePurp)' />
</true>
</if>
<assign value='source.HowSaleMade.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.HowSaleMade}' action='set' />
<assign value='source.ReversionRateType.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.TypeReversionRate}' action='set' />
<assign value='source.GovtInitiative' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.GovernmentInitiative}' action='set' />
<if condition='source.RepayStrat1' >
<true>
<assign value='source.RepayStrat1' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.RepaymentStrategy()}' action='set' key='$I(repStrategy)' />
</true>
</if>
<if condition='source.RepayStrat2' >
<true>
<assign value='source.RepayStrat2' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.RepaymentStrategy()}' action='set' key='$I(repStrategy)' />
</true>
</if>
<if condition='source.RepayStrat3' >
<true>
<assign value='source.RepayStrat3' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.RepaymentStrategy()}' action='set' key='$I(repStrategy)' />
</true>
</if>
<if condition='source.RepayStrat4' >
<true>
<assign value='source.RepayStrat4' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.RepaymentStrategy()}' action='set' key='$I(repStrategy)' />
</true>
</if>
<if condition='source.RepayStrat5' >
<true>
<assign value='source.RepayStrat5' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.RepaymentStrategy()}' action='set' key='$I(repStrategy)' />
</true>
</if>
<if condition='source.RepayStrat6' >
<true>
<assign value='source.RepayStrat6' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.RepaymentStrategy()}' action='set' key='$I(repStrategy)' />
</true>
</if>
<if condition='source.RepayStrat7' >
<true>
<assign value='source.RepayStrat7' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.RepaymentStrategy()}' action='set' key='$I(repStrategy)' />
</true>
</if>
<if condition='source.RepayStrat8' >
<true>
<assign value='source.RepayStrat8' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.RepaymentStrategy()}' action='set' key='$I(repStrategy)' />
</true>
</if>
<if condition='source.RepayStrat9' >
<true>
<assign value='source.RepayStrat9' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.RepaymentStrategy()}' action='set' key='$I(repStrategy)' />
</true>
</if>
<if condition='source.RepayStrat10' >
<true>
<assign value='source.RepayStrat10' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.RepaymentStrategy()}' action='set' key='$I(repStrategy)' />
</true>
</if>
<if condition='source.RepayStrat11' >
<true>
<assign value='source.RepayStrat11' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.RepaymentStrategy()}' action='set' key='$I(repStrategy)' />
</true>
</if>
<assign value='source.PercentageIO' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.PercentageIO}' action='set' />
<assign value='source.InterestRollUp' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.InterestRollUp}' action='set' />
<assign value='source.ValuationType.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.ValuationType}' action='set' />
<assign value='$ZDate(source.SecondaryDateOfBirth,3)' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.SecondDOB}' action='set' />
<assign value='source.MoneyWithdrawn' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MoneyWithdrawn}' action='set' />
<assign value='source.DebtConsolidationAmt' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.AmountDebtCons}' action='set' />
<assign value='source.EarlyRepaymentCharge' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.EarlyRepaymentCharge}' action='set' />
<assign value='source.NewDwelling' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.NewDwelling}' action='set' />
<assign value='source.Affordability.HasGarage' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.GarageInc}' action='set' />
<assign value='source.Affordability.MtgeProtection' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MtgeProtectionPlanInc}' action='set' />
<assign value='source.Currency' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.Currency}' action='set' />
<assign value='source.CustomerPct' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.CustomersShare}' action='set' />
<assign value='source.TotalLoanAvailable' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.TotalLoanAvailable}' action='set' />
<assign value='source.LenderFee' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.LenderFees}' action='set' />
<assign value='source.IntermediaryFee' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.IntermediaryFees}' action='set' />
<assign value='source.TotalFeesCharges' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.FeesChargesAdded}' action='set' />
<assign value='source.ProcurationFee' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.ProcurationFee}' action='set' />
<assign value='source.Affordability.NumBorrowersAssessed' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.NumberAssessed}' action='set' />
<assign value='source.Affordability.NumDependentAdults' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.DependentAdults}' action='set' />
<assign value='source.Affordability.NumDependChildren' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.DependentChildren}' action='set' />
<assign value='source.Affordability.SecondaryEmpStatus.Code' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.SecondEmpStatus}' action='set' />
<assign value='source.Affordability.PrimaryRetireAge' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MainRetirementAge}' action='set' />
<assign value='source.Affordability.SecondaryRetireAge' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.SecondRetirementAge}' action='set' />
<assign value='source.Affordability.PrimaryGrossPay' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MainGrossBasicPay}' action='set' />
<assign value='source.Affordability.PrimaryGrossOtherIncomeEmploy' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MainGrossOtherIncomeEmployment}' action='set' />
<assign value='source.Affordability.PrimaryGrossIncomeSelfEmploy' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MainGrossIncomeSelfEmployment}' action='set' />
<assign value='source.Affordability.PrimaryGrossOtherIncome' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MainGrossOtherIncome}' action='set' />
<assign value='source.Affordability.SecondaryGrossPay' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.SecondGrossBasicPay}' action='set' />
<assign value='source.Affordability.SecondaryGrossIncomeEmploy' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.SecondGrossOtherIncomeEmployment}' action='set' />
<assign value='source.Affordability.SecondaryGrossSelfEmploy' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.SecondGrossIncomeSelfEmployment}' action='set' />
<assign value='source.Affordability.SecondaryGrossOtherIncome' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.SecondGrossOtherIncome}' action='set' />
<assign value='source.Affordability.TertiaryGrossPay' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.ThirdGrossBasicPay}' action='set' />
<assign value='source.Affordability.TertiaryGrossIncomeEmploy' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.ThirdGrossOtherIncomeEmployment}' action='set' />
<assign value='source.Affordability.TertiaryGrossSelfEmploy' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.ThirdGrossIncomeSelfEmployment}' action='set' />
<assign value='source.Affordability.TertiaryGrossOtherIncome' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.ThirdGrossOtherIncome}' action='set' />
<assign value='source.Affordability.PrimaryTotalVerifiedIncme' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MainTotalVerifiedNetIncome}' action='set' />
<assign value='source.Affordability.SecondaryTotalVerifiedNetIncome' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.SecondTotalVerifiedNetIncome}' action='set' />
<assign value='source.Affordability.TertiaryTotalVerifiedNetIncome' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.ThirdTotalVerifiedNetIncome}' action='set' />
<assign value='source.Affordability.TotalOutstandingCredits' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.TotalOutstandingCredits}' action='set' />
<assign value='source.Affordability.MonthlyExpenditure' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MonthlyExpenditure}' action='set' />
<assign value='source.Affordability.BasicExpenditure' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.BasicExpenditure}' action='set' />
<assign value='source.Affordability.StressTestedInterestRate' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.StressTestedInterestRate}' action='set' />
<assign value='source.Affordability.MtgeConductOfBusinessUsed' property='target.{FSAHSFFeedMGMsg(aux).Mortgage.MCOBUsed}' action='set' />
</transform>
}

}
