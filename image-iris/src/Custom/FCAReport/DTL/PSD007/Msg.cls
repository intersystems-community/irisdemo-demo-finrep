Class Custom.FCAReport.DTL.PSD007.Msg Extends Ens.DataTransformDTL [ DependsOn = (Canonical.MortgagePerf, FCA.PSD007.PSD007MortgagePerformanceSalesData) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Canonical.MortgagePerf' targetClass='FCA.PSD007.PSD007MortgagePerformanceSalesData' create='existing' language='objectscript' >
<assign value='source.Mortgage.FirmId' property='target.PSD007FeedMsg.(aux).CoreItems.AdminFRN' action='set' />
<assign value='source.Mortgage.PropertyPostCode' property='target.PSD007FeedMsg.(aux).CoreItems.Postcode' action='set' />
<assign value='source.Mortgage.PrimaryDateOfBirth' property='target.PSD007FeedMsg.(aux).CoreItems.MainDOB' action='set' />
<assign value='source.Mortgage.AcctOpenDate' property='target.PSD007FeedMsg.(aux).CoreItems.AcctOpenedDate' action='set' />
<assign value='source.Mortgage.TransactionId' property='target.PSD007FeedMsg.(aux).CoreItems.TransRef' action='set' />
<assign value='source.DateofBalance' property='target.PSD007FeedMsg.(aux).CoreItems.DateofBalance' action='set' />
<assign value='source.LoanPurchase' property='target.PSD007FeedMsg.(aux).CoreItems.LoanPurchase' action='set' />
<assign value='source.Mortgage.LoanAmt' property='target.PSD007FeedMsg.(aux).CoreItems.OrigLoanSize' action='set' />
<assign value='source.Mortgage.MtgeTerm' property='target.PSD007FeedMsg.(aux).CoreItems.OrigLoanTerm' action='set' />
<assign value='source.OrigProviderFRN' property='target.PSD007FeedMsg.(aux).CoreItems.OrigProviderFRN' action='set' />
<assign value='source.OutstandingBalance' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.OutstandingBalance' action='set' />
<assign value='source.Mortgage.Affordability.MonthlyExpenditure' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.MonthlyPayment' action='set' />
<assign value='source.ValueLinkedAccounts' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.ValueLinkedAccounts' action='set' />
<assign value='source.Mortgage.InitialGrossIntRate' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.GrossInterestCharged' action='set' />
<assign value='..ReplaceStr(source.Mortgage.IntRateType.Code,"03","99")' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.TypeIntRate' action='set' />
<assign value='source.IncentivisedRate' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.IncentivisedRate' action='set' />
<assign value='source.Mortgage.IncentiveRateEndDate' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.DateIncentiveEnds' action='set' />
<assign value='source.RemainingTerm' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.RemainingTerm' action='set' />
<assign value='source.MonthsPastMaturity' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.MonthsPastMaturity' action='set' />
<assign value='source.Mortgage.RepayMethod.Code' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.RepaymentMethod' action='set' />
<assign value='source.ReasonForClosure.Code' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.ReasonForClosure' action='set' />
<assign value='source.CurrentPaymentShortfall' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.CurrentPaymentShortfall' action='set' />
<assign value='source.ArrearsStartDate' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.ArrearsStartDate' action='set' />
<assign value='source.PaymentShortfallArrangement' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.PaymentShortfallArrangement' action='set' />
<assign value='source.DateFormalArrangement' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.DateFormalArrangement' action='set' />
<assign value='source.PaymentShortfallCapitalisation' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.PaymentShortfallCapitalisation' action='set' />
<assign value='source.CapitalisationDate' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.CapitalisationDate' action='set' />
<assign value='source.PaymentsSuspended' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.PaymentsSuspended' action='set' />
<assign value='source.InterestOnlyDate' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.InterestOnlyDate' action='set' />
<assign value='source.DatesPaymentsSuspended' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.DatesPaymentsSuspended' action='set' />
<assign value='source.ReducedPayments' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.ReducedPayments' action='set' />
<assign value='source.DateReducedPayments' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.DateReducedPayments' action='set' />
<assign value='source.TermExtension' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.TermExtension' action='set' />
<assign value='source.DateTermExtension' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.DateTermExtension' action='set' />
<assign value='source.OtherForbearance' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.OtherForbearance' action='set' />
<assign value='source.DateOtherForbearance' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.DateOtherForbearance' action='set' />
<assign value='source.DateLitigationStarted' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.DateLitigationStarted' action='set' />
<assign value='source.PossessionOrder' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.PossessionOrder' action='set' />
<assign value='source.DatePossession' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.DatePossession' action='set' />
<assign value='source.RepossessionSaleValueAchieved' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.RepossessionSaleValueAchieved' action='set' />
<assign value='source.SecondChargeMortgage' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.SecondChargeMortgage' action='set' />
<assign value='source.SwitchInterestOnly' property='target.PSD007FeedMsg.(aux).PerformanceSalesData.SwitchInterestOnly' action='set' />
</transform>
}

}
