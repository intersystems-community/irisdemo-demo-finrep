Class Canonical.UtilityFunctions Extends Ens.Rule.FunctionSet
{

ClassMethod Mortgage(FirmId = "", TransactionId = "") As Canonical.Mortgage
{
 If FirmId="" {
   Return ##class(Canonical.Mortgage).%New()
 } Else {
   Set obj=##class(Canonical.Mortgage).FirmAndTransIndexOpen(FirmId,TransactionId)
   If obj="" Return ##class(Canonical.Mortgage).%New()
   Return obj
 }
}

}
