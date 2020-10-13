Class Hyperledger.BO.CreatePSD001Resp Extends Ens.Response [ Language = objectscript ]
{

Property ReportIdentifier As %String;

Property ReportCreationDate As %String;

Property ReportContent As %String;

Property SubmittingFirm As %String;

Property SubmittingDepartment As %String;

Property responseState As %String;

Storage Default
{
<Data name="CreatePSD001RespDefaultData">
<Subscript>"CreatePSD001Resp"</Subscript>
<Value name="1">
<Value>ReportIdentifier</Value>
</Value>
<Value name="2">
<Value>ReportCreationDate</Value>
</Value>
<Value name="3">
<Value>ReportContent</Value>
</Value>
<Value name="4">
<Value>SubmittingFirm</Value>
</Value>
<Value name="5">
<Value>SubmittingDepartment</Value>
</Value>
<Value name="6">
<Value>responseState</Value>
</Value>
<Value name="7">
<Value>ReportContentFile</Value>
</Value>
</Data>
<DefaultData>CreatePSD001RespDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
