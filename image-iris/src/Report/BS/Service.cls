Class Report.BS.Service Extends Ens.BusinessService
{

Method OnProcessInput(pInput As Report.BP.Request, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
	Quit ..SendRequestAsync("Reporting Process", pInput)
}

}
