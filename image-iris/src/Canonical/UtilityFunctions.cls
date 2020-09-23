Class Canonical.UtilityFunctions Extends Ens.Rule.FunctionSet
{

ClassMethod Mortgage(FirmId = "", TransactionId = "") As Canonical.Mortgage
{
 Set new=0
 If FirmId="" {
   Set obj = ##class(Canonical.Mortgage).%New()
   Set new=1
 } Else {
   Set obj=##class(Canonical.Mortgage).FirmAndTransIndexOpen(FirmId, TransactionId)
   If obj="" { 
     Set obj = ##class(Canonical.Mortgage).%New()
     Set new=1
   }
 }
 If new {
   Set obj.FirmId=FirmId
   Set obj.TransactionId=TransactionId
 }
 Return obj
}

ClassMethod MortgageAfford(Mortgage = "", AsOfDate = "") As Canonical.MortgageAfford
{
 Set new=0
 If Mortgage="" {
   Set obj = ##class(Canonical.MortgageAfford).%New()
   Set new=1
 } Else {
   Set obj=##class(Canonical.MortgageAfford).MortgagePerformancePKOpen(Mortgage.%Id(), AsOfDate)
   If obj="" { 
     Set obj = ##class(Canonical.MortgageAfford).%New()
     Set new=1
   }
 }
 If new {
   Set obj.Mortgage=Mortgage
   Set obj.AsOfDate=AsOfDate
 }
 Return obj
}

ClassMethod MortgagePerf(Mortgage = "", AsOfDate = "") As Canonical.MortgagePerf
{
 Set new=0
 If Mortgage="" {
   Set obj = ##class(Canonical.MortgagePerf).%New()
   Set new=1
 } Else {
   Set obj=##class(Canonical.MortgagePerf).FirmAndTransIndexOpen(Mortgage.%Id(), AsOfDate)
   If obj="" { 
     Set obj = ##class(Canonical.MortgagePerf).%New()
     Set new=1
   }
 }
 If new {
   Set obj.Mortgage=Mortgage
   Set obj.AsOfDate=AsOfDate
 }
 Return obj
}

}
