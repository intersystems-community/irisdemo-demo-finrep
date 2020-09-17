Class Cube.BO.Operation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method SynchronizeCubeList(pRequest As SynchronizeCubeListReq, Output pResponse As Ens.Response) As %Status
{
    Set tSC = $$$OK
    Try 
    {
        For i=1:1:$Length(pRequest.CubeList,",")
        {
            Set tCubeName = $Piece(pRequest.CubeList,",", i)

            $$$TRACE("Synchronizing cube "_tCubeName_"...")
            // Making it simple for now...
            //Set tSC = ##class(%DeepSee.Utils).%SynchronizeCube(tCubeName, 0)
            Set tSC = ##class(%DeepSee.Utils).%BuildCube(tCubeName)
            Quit:$System.Status.IsError(tSC)

            $$$TRACE("Cube "_tCubeName_" synchronized!")
        }
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
  <MapItem MessageType="Cube.BO.SynchronizeCubeListReq">
    <Method>SynchronizeCubeList</Method>
  </MapItem>
</MapItems>
}

}
