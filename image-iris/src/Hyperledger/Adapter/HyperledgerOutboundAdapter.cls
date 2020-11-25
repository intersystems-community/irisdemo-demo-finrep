Class Hyperledger.Adapter.HyperledgerOutboundAdapter Extends Common
{

Property %remoteClassname As %String [ InitialExpression = "irisdemo.hyperledger.HyperledgerOutboundAdapter" ];

/// Parameter SETTINGS = "-CallInterval,SchemaRegistryConfig:Basic:selector?context={SchemaRegistry.Monitor.ContextSearch/Configs},KeyDeserializerClassName";
Method OnInit() As %Status
{
    $$$LOGINFO("HyperledgerOutboundAdapter.OnInit()")

	Quit ##super()
}

Method SubmitReport(pReq As %RegisteredObject) As %String
{
    Do ..%DispatchMethod("SubmitReportToHyperledger", pReq)
}

}
