Class Hyperledger.BO.CreatePSD001Req Extends Ens.Request [ Language = objectscript ]
{

Property reportIdentifier As %String;

Property reportCreationDate As %String;

Property reportContent As %String;

Property submittingFirm As %String;

Property submittingDepartment As %String;

Storage Default
{
<Data name="CreatePSD001ReqDefaultData">
<Subscript>"CreatePSD001Req"</Subscript>
<Value name="1">
<Value>reportIdentifier</Value>
</Value>
<Value name="2">
<Value>reportCreationDate</Value>
</Value>
<Value name="3">
<Value>reportContent</Value>
</Value>
<Value name="4">
<Value>submittingFirm</Value>
</Value>
<Value name="5">
<Value>submittingDepartment</Value>
</Value>
</Data>
<DefaultData>CreatePSD001ReqDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
