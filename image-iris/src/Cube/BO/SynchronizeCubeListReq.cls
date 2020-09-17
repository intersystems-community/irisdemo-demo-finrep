Class Cube.BO.SynchronizeCubeListReq Extends (%Persistent, %XML.Adaptor)
{

Property CubeList As %String(MAXLEN = "") [ Required ];

Storage Default
{
<Data name="SynchronizeCubeListReqDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CubeList</Value>
</Value>
</Data>
<DataLocation>^Cube.BO.SynchronizeC9C8D</DataLocation>
<DefaultData>SynchronizeCubeListReqDefaultData</DefaultData>
<IdLocation>^Cube.BO.SynchronizeC9C8D</IdLocation>
<IndexLocation>^Cube.BO.SynchronizeC9C8I</IndexLocation>
<StreamLocation>^Cube.BO.SynchronizeC9C8S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
