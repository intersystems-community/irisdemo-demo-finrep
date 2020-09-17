Class Canonical.CT.UtilityFunctions Extends Ens.Rule.FunctionSet [ GeneratedBy = Canonical.CT.BorrowerImpCredHist.CLS, Not ProcedureBlock ]
{

ClassMethod CTBorrowerImpCredHist(Code = "") As Canonical.CT.BorrowerImpCredHist
{
 If Code="" Return ""
 Set obj=##class(Canonical.CT.BorrowerImpCredHist).CodeIndexOpen(Code,,.tSC)
 If $$$ISERR(tSC) { 
    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,"Could not find entry on table Canonical.CT.BorrowerImpCredHist."))
    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
 }
 Return obj
}

ClassMethod CTBorrowerType(Code = "") As Canonical.CT.BorrowerType
{
 If Code="" Return ""
 Set obj=##class(Canonical.CT.BorrowerType).CodeIndexOpen(Code,,.tSC)
 If $$$ISERR(tSC) { 
    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,"Could not find entry on table Canonical.CT.BorrowerType."))
    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
 }
 Return obj
}

ClassMethod CTHowSaleMade(Code = "") As Canonical.CT.HowSaleMade
{
 If Code="" Return ""
 Set obj=##class(Canonical.CT.HowSaleMade).CodeIndexOpen(Code,,.tSC)
 If $$$ISERR(tSC) { 
    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,"Could not find entry on table Canonical.CT.HowSaleMade."))
    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
 }
 Return obj
}

ClassMethod CTIncomeBasis(Code = "") As Canonical.CT.IncomeBasis
{
 If Code="" Return ""
 Set obj=##class(Canonical.CT.IncomeBasis).CodeIndexOpen(Code,,.tSC)
 If $$$ISERR(tSC) { 
    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,"Could not find entry on table Canonical.CT.IncomeBasis."))
    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
 }
 Return obj
}

ClassMethod CTIncomeVerification(Code = "") As Canonical.CT.IncomeVerification
{
 If Code="" Return ""
 Set obj=##class(Canonical.CT.IncomeVerification).CodeIndexOpen(Code,,.tSC)
 If $$$ISERR(tSC) { 
    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,"Could not find entry on table Canonical.CT.IncomeVerification."))
    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
 }
 Return obj
}

ClassMethod CTMCOBUsed(Code = "") As Canonical.CT.MCOBUsed
{
 If Code="" Return ""
 Set obj=##class(Canonical.CT.MCOBUsed).CodeIndexOpen(Code,,.tSC)
 If $$$ISERR(tSC) { 
    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,"Could not find entry on table Canonical.CT.MCOBUsed."))
    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
 }
 Return obj
}

ClassMethod CTMainEmpStatus(Code = "") As Canonical.CT.MainEmpStatus
{
 If Code="" Return ""
 Set obj=##class(Canonical.CT.MainEmpStatus).CodeIndexOpen(Code,,.tSC)
 If $$$ISERR(tSC) { 
    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,"Could not find entry on table Canonical.CT.MainEmpStatus."))
    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
 }
 Return obj
}

ClassMethod CTMtgeType(Code = "") As Canonical.CT.MtgeType
{
 If Code="" Return ""
 Set obj=##class(Canonical.CT.MtgeType).CodeIndexOpen(Code,,.tSC)
 If $$$ISERR(tSC) { 
    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,"Could not find entry on table Canonical.CT.MtgeType."))
    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
 }
 Return obj
}

ClassMethod CTRemtgePurpose(Code = "") As Canonical.CT.RemtgePurpose
{
 If Code="" Return ""
 Set obj=##class(Canonical.CT.RemtgePurpose).CodeIndexOpen(Code,,.tSC)
 If $$$ISERR(tSC) { 
    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,"Could not find entry on table Canonical.CT.RemtgePurpose."))
    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
 }
 Return obj
}

ClassMethod CTRepayMethod(Code = "") As Canonical.CT.RepayMethod
{
 If Code="" Return ""
 Set obj=##class(Canonical.CT.RepayMethod).CodeIndexOpen(Code,,.tSC)
 If $$$ISERR(tSC) { 
    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,"Could not find entry on table Canonical.CT.RepayMethod."))
    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
 }
 Return obj
}

ClassMethod CTRepaymentStrategy(Code = "") As Canonical.CT.RepaymentStrategy
{
 If Code="" Return ""
 Set obj=##class(Canonical.CT.RepaymentStrategy).CodeIndexOpen(Code,,.tSC)
 If $$$ISERR(tSC) { 
    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,"Could not find entry on table Canonical.CT.RepaymentStrategy."))
    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
 }
 Return obj
}

ClassMethod CTTypeDwelling(Code = "") As Canonical.CT.TypeDwelling
{
 If Code="" Return ""
 Set obj=##class(Canonical.CT.TypeDwelling).CodeIndexOpen(Code,,.tSC)
 If $$$ISERR(tSC) { 
    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,"Could not find entry on table Canonical.CT.TypeDwelling."))
    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
 }
 Return obj
}

ClassMethod CTTypeIntRate(Code = "") As Canonical.CT.TypeIntRate
{
 If Code="" Return ""
 Set obj=##class(Canonical.CT.TypeIntRate).CodeIndexOpen(Code,,.tSC)
 If $$$ISERR(tSC) { 
    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,"Could not find entry on table Canonical.CT.TypeIntRate."))
    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
 }
 Return obj
}

ClassMethod CTTypeReversionRate(Code = "") As Canonical.CT.TypeReversionRate
{
 If Code="" Return ""
 Set obj=##class(Canonical.CT.TypeReversionRate).CodeIndexOpen(Code,,.tSC)
 If $$$ISERR(tSC) { 
    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,"Could not find entry on table Canonical.CT.TypeReversionRate."))
    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
 }
 Return obj
}

ClassMethod CTValuationType(Code = "") As Canonical.CT.ValuationType
{
 If Code="" Return ""
 Set obj=##class(Canonical.CT.ValuationType).CodeIndexOpen(Code,,.tSC)
 If $$$ISERR(tSC) { 
    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,"Could not find entry on table Canonical.CT.ValuationType."))
    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
 }
 Return obj
}

}
