Class Normalization.UtilityFunctions Extends Ens.Rule.FunctionSet
{

ClassMethod Today() As %Date
{
  Quit +$Horolog
}

ClassMethod Years(pYears As %Integer) As %Date
{
  Quit pYears*365
}

}
