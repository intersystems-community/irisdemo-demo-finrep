Class Custom.Normalization.DTL.Perf Extends Ens.DataTransformDTL [ DependsOn = (Staging.RM.MortgagePerf.Record, Canonical.MortgagePerf) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Staging.RM.MortgagePerf.Record' targetClass='Canonical.MortgagePerf' create='new' language='objectscript' >
<assign value='..Lookup("ReasonForClosure",source.LegacyReasonForClosure)' property='reasonForClosureCode' action='set' />
<assign value='##class(Canonical.UtilityFunctions).Mortgage(source.LegacyFirmId,source.LegacyTransRef)' property='mortgage' action='set' />
<assign value='##class(Canonical.UtilityFunctions).MortgagePerf(mortgage,$ZDateH(source.LegacyAsOfDate,3))' property='target' action='set' />
<assign value='source.LegacyLoanPurchase' property='target.LoanPurchase' action='set' />
<assign value='source.LegacyOrigProviderFRN' property='target.OrigProviderFRN' action='set' />
<assign value='source.LegacyOutstandingBalance' property='target.OutstandingBalance' action='set' />
<assign value='source.LegacyValueLinkedAccounts' property='target.ValueLinkedAccounts' action='set' />
<assign value='source.LegacyIncentivisedRate' property='target.IncentivisedRate' action='set' />
<assign value='source.LegacyRemainingTerm' property='target.RemainingTerm' action='set' />
<assign value='source.LegacyMonthsPastMaturity' property='target.MonthsPastMaturity' action='set' />
<assign value='##class(Canonical.CT.UtilityFunctions).CTReasonForClosure(reasonForClosureCode)' property='target.ReasonForClosure' action='set' />
<assign value='source.LegacyCurrentPaymentShortfall' property='target.CurrentPaymentShortfall' action='set' />
<if condition='(source.LegacyArrearsStartDate&apos;="") &amp;&amp; (source.LegacyArrearsStartDate&apos;="0")' >
<true>
<assign value='$ZDateH(source.LegacyArrearsStartDate,3)' property='target.ArrearsStartDate' action='set' />
</true>
</if>
<assign value='source.LegacyPaymentShortfallArrangement' property='target.PaymentShortfallArrangement' action='set' />
<if condition='source.LegacyDateFormalArrangement&apos;=""' >
<true>
<assign value='$ZDateH(source.LegacyDateFormalArrangement,3)' property='target.DateFormalArrangement' action='set' />
</true>
</if>
<assign value='source.LegacyPaymentShortfallCapitalisation' property='target.PaymentShortfallCapitalisation' action='set' />
<if condition='source.LegacyCapitalisationDate&apos;=""' >
<true>
<assign value='$ZDateH(source.LegacyCapitalisationDate,3)' property='target.CapitalisationDate' action='set' />
</true>
</if>
<if condition='source.LegacyInterestOnlyDate&apos;=""' >
<true>
<assign value='$ZDateH(source.LegacyInterestOnlyDate,3)' property='target.InterestOnlyDate' action='set' />
</true>
</if>
<assign value='source.LegacyPaymentsSuspended' property='target.PaymentsSuspended' action='set' />
<if condition='source.LegacyDatesPaymentsSuspended&apos;=""' >
<true>
<assign value='$ZDateH(source.LegacyDatesPaymentsSuspended,3)' property='target.DatesPaymentsSuspended' action='set' />
</true>
</if>
<assign value='source.LegacyReducedPayments' property='target.ReducedPayments' action='set' />
<if condition='source.LegacyDateReducedPayments&apos;=""' >
<true>
<assign value='$ZDateH(source.LegacyDateReducedPayments,3)' property='target.DateReducedPayments' action='set' />
</true>
</if>
<assign value='source.LegacyTermExtension' property='target.TermExtension' action='set' />
<if condition='source.LegacyDateTermExtension&apos;=""' >
<true>
<assign value='$ZDateH(source.LegacyDateTermExtension,3)' property='target.DateTermExtension' action='set' />
</true>
</if>
<assign value='source.LegacyOtherForbearance' property='target.OtherForbearance' action='set' />
<if condition='source.LegacyDateOtherForbearance&apos;=""' >
<true>
<assign value='$ZDateH(source.LegacyDateOtherForbearance,3)' property='target.DateOtherForbearance' action='set' />
</true>
</if>
<if condition='source.LegacyDateLitigationStarted&apos;=""' >
<true>
<assign value='$ZDateH(source.LegacyDateLitigationStarted,3)' property='target.DateLitigationStarted' action='set' />
</true>
</if>
<assign value='source.LegacyPossessionOrder' property='target.PossessionOrder' action='set' />
<if condition='source.LegacyDatePossession&apos;=""' >
<true>
<assign value='$ZDateH(source.LegacyDatePossession,3)' property='target.DatePossession' action='set' />
</true>
</if>
<assign value='source.LegacyRepossessionSaleValueAchieved' property='target.RepossessionSaleValueAchieved' action='set' />
<if condition='source.LegacyDateofBalance&apos;=""' >
<true>
<assign value='$ZDateH(source.LegacyDateofBalance,3)' property='target.DateofBalance' action='set' />
</true>
</if>
<assign value='source.LegacySecondChargeMortgage' property='target.SecondChargeMortgage' action='set' />
<assign value='source.LegacyBeneficialOwnerRegFirm' property='target.BeneficialOwnerRegFirm' action='set' />
<assign value='source.LegacyBeneficialOwnerFRN' property='target.BeneficialOwnerFRN' action='set' />
<assign value='source.LegacyBeneficialOwnerName' property='target.BeneficialOwnerName' action='set' />
<assign value='source.LegacyLegalOwnerRegFirm' property='target.LegalOwnerRegFirm' action='set' />
<assign value='source.LegacyLegalOwnerFRN' property='target.LegalOwnerFRN' action='set' />
<assign value='source.LegacyLegalOwnerName' property='target.LegalOwnerName' action='set' />
<assign value='source.LegacyClosedBook' property='target.ClosedBook' action='set' />

</transform>
}

}
