Include DEMOMACROS

Class Hyperledger.BO.Operation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "Hyperledger.Adapter.HyperledgerOutboundAdapter";

Parameter INVOCATION = "Queue";

Property Adapter As Hyperledger.Adapter.HyperledgerOutboundAdapter;

Method CreatePSD001(pRequest As Hyperledger.BO.CreatePSD001Req, Output pResponse As Hyperledger.BO.CreatePSD001Resp) As %Status
{
	Set tSC = $$$OK
	Try
	{
		$$$TRACE("Creating PSD001")
        Set s = ..Adapter.TestAdapter(pRequest)
        $$$TRACE(s.StringValue)
		///Quit:$System.Status.IsError(tSC)

        Set pResponse = ##class(Hyperledger.BO.CreatePSD001Resp).%New()
        Set pResponse.responseState = "Created PSD001"
	}
	Catch (oException)
	{
		Set tSC = oException.AsStatus()
	}
	
	Quit tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Hyperledger.BO.CreatePSD001Req">
    <Method>CreatePSD001</Method>
  </MapItem>
</MapItems>
}

}
