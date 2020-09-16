Class Custom.Normalization.DTL.Trans Extends Ens.DataTransformDTL [ DependsOn = (Staging.RM.MortgageTrans.Record, Canonical.Mortgage) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Staging.RM.MortgageTrans.Record' targetClass='Canonical.Mortgage' create='new' language='objectscript' >
<assign value='##class(Canonical.UtilityFunctions).Mortgage(source.LegacyFirmId,source.LegacyTransId)' property='target' action='set' />
<assign value='$ZDateH(source.LegacyAsOfDate,3)' property='target.AsOfDate' action='set' />
<assign value='$ZDateH(source.LegacyAcctOpen,3)' property='target.AcctOpenDate' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTBorrowerType(source.LegacyBorrowerType)' property='target.BorrowerType' action='set' />
<assign value='source.LegacyLoanAmt' property='target.LoanAmt' action='set' />
<assign value='$ZDateH(source.LegacyPrimaryDOB,3)' property='target.PrimaryDateOfBirth' action='set' />
<assign value='$ZDateH(source.LegacySecondaryDOB,3)' property='target.SecondaryDateOfBirth' action='set' />
<assign value='source.LegacyPrimaryBorrowerCCJValue' property='target.PrimaryBorrowerCCJValue' action='set' />
<assign value='source.LegacySecondaryBorrowerCCJValue' property='target.SecondaryBorrowerCCJValue' action='set' />
<assign value='source.LegacyInitialGrossIntRate' property='target.InitialGrossIntRate' action='set' />
<assign value='source.LegacyPrincipalOrNetworkFirmId' property='target.PrincipalOrNetworkFirmId' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeChar(source.LegacyMtgeCharacteristic1)' property='target.MtgeCharacteristic1' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeChar(source.LegacyMtgeCharacteristic2)' property='target.MtgeCharacteristic2' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeChar(source.LegacyMtgeCharacteristic3)' property='target.MtgeCharacteristic3' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeChar(source.LegacyMtgeCharacteristic4)' property='target.MtgeCharacteristic4' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeChar(source.LegacyMtgeCharacteristic5)' property='target.MtgeCharacteristic5' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTTypeIntRate(source.LegacyIntRateType)' property='target.IntRateType' action='set' />
<assign value='source.LegacyPropertyValue' property='target.PropertyValue' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTBorrowerImpCredHist(source.LegacyPrimaryBorrowerCrdHist1)' property='target.PrimaryBorrowerCrdHist1' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTBorrowerImpCredHist(source.LegacyPrimaryBorrowerCrdHist2)' property='target.PrimaryBorrowerCrdHist2' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTBorrowerImpCredHist(source.LegacyPrimaryBorrowerCrdHist3)' property='target.PrimaryBorrowerCrdHist3' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTBorrowerImpCredHist(source.LegacyPrimaryBorrowerCrdHist4)' property='target.PrimaryBorrowerCrdHist4' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTBorrowerImpCredHist(source.LegacySecondaryBorrowerCrdHist1)' property='target.SecondaryBorrowerCrdHist1' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTBorrowerImpCredHist(source.LegacySecondaryBorrowerCrdHist2)' property='target.SecondaryBorrowerCrdHist2' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTBorrowerImpCredHist(source.LegacySecondaryBorrowerCrdHist3)' property='target.SecondaryBorrowerCrdHist3' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTBorrowerImpCredHist(source.LegacySecondaryBorrowerCrdHist4)' property='target.SecondaryBorrowerCrdHist4' action='set' />
<assign value='$ZDateH(source.LegacyIncentiveRateEndDate,3)' property='target.IncentiveRateEndDate' action='set' />
<assign value='source.LegacyNewDwelling' property='target.NewDwelling' action='set' />
<assign value='source.LegacyAdvisedSale' property='target.AdvisedSale' action='set' />
<assign value='source.LegacyPropertyPostCode' property='target.PropertyPostCode' action='set' />
<assign value='source.LegacyMtgeTerm' property='target.MtgeTerm' action='set' />
<assign value='source.LegacyPurchasePrice' property='target.PurchasePrice' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTIncomeBasis(source.LegacyIncomeBasis)' property='target.IncomeBasisType' action='set' />
<assign value='$ZDateH(source.LegacyERCEndDate,3)' property='target.ERCEndDate' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTHowSaleMade(source.LegacyHowSaleMade)' property='target.HowSaleMade' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTTypeReversionRate(source.LegacyReversionRateType)' property='target.ReversionRateType' action='set' />
<assign value='source.LegacyGovtInitiative' property='target.GovtInitiative' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRepayMethod(source.LegacyRepayMethod)' property='target.RepayMethod' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRepaymentStrategy(source.LegacyRepayStrat1)' property='target.RepayStrat1' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRepaymentStrategy(source.LegacyRepayStrat2)' property='target.RepayStrat2' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRepaymentStrategy(source.LegacyRepayStrat3)' property='target.RepayStrat3' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRepaymentStrategy(source.LegacyRepayStrat4)' property='target.RepayStrat4' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRepaymentStrategy(source.LegacyRepayStrat5)' property='target.RepayStrat5' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRepaymentStrategy(source.LegacyRepayStrat6)' property='target.RepayStrat6' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRepaymentStrategy(source.LegacyRepayStrat7)' property='target.RepayStrat7' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRepaymentStrategy(source.LegacyRepayStrat8)' property='target.RepayStrat8' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRepaymentStrategy(source.LegacyRepayStrat9)' property='target.RepayStrat9' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRepaymentStrategy(source.LegacyRepayStrat10)' property='target.RepayStrat10' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRepaymentStrategy(source.LegacyRepayStrat11)' property='target.RepayStrat11' action='set' />
<assign value='source.LegacyPercentageIO' property='target.PercentageIO' action='set' />
<assign value='source.LegacyInterestRollUp' property='target.InterestRollUp' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTValuationType(source.LegacyValuationType)' property='target.ValuationType' action='set' />
<assign value='source.LegacyMoneyWithdrawn' property='target.MoneyWithdrawn' action='set' />
<assign value='source.LegacyDebtConsolidationAmt' property='target.DebtConsolidationAmt' action='set' />
<assign value='source.LegacyEarlyRepaymentCharge' property='target.EarlyRepaymentCharge' action='set' />
<assign value='source.LegacyCurrency' property='target.Currency' action='set' />
<assign value='source.LegacyCustomerPct' property='target.CustomerPct' action='set' />
<assign value='source.LegacyTotalLoanAvailable' property='target.TotalLoanAvailable' action='set' />
<assign value='source.LegacyLenderFee' property='target.LenderFee' action='set' />
<assign value='source.LegacyIntermediaryFee' property='target.IntermediaryFee' action='set' />
<assign value='source.LegacyProcurationFee' property='target.ProcurationFee' action='set' />
<assign value='source.LegacyTotalFeesCharges' property='target.TotalFeesCharges' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeType(source.LegacyMtgeType1)' property='target.MtgeType1' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeType(source.LegacyMtgeType2)' property='target.MtgeType2' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeType(source.LegacyMtgeType3)' property='target.MtgeType3' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeType(source.LegacyMtgeType4)' property='target.MtgeType4' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeType(source.LegacyMtgeType5)' property='target.MtgeType5' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeType(source.LegacyMtgeType6)' property='target.MtgeType6' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeType(source.LegacyMtgeType7)' property='target.MtgeType7' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeType(source.LegacyMtgeType8)' property='target.MtgeType8' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeType(source.LegacyMtgeType9)' property='target.MtgeType9' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeType(source.LegacyMtgeType10)' property='target.MtgeType10' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTMtgeType(source.LegacyMtgeType11)' property='target.MtgeType11' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRemtgePurpose(source.LegacyRemtgePurpose1)' property='target.RemtgePurpose1' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRemtgePurpose(source.LegacyRemtgePurpose2)' property='target.RemtgePurpose2' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTRemtgePurpose(source.LegacyRemtgePurpose3)' property='target.RemtgePurpose3' action='set' />
</transform>
}

}
