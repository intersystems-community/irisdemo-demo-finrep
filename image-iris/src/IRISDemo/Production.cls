Class IRISDemo.Production Extends IRISDemo.BaseProduction
{

/// For this demo, we will build the empty cube MortgageSales once (it's empty)
/// so it can be synchronized during the demo
ClassMethod OnStart(pTimeStarted As %String) As %Status
{
    Set tSC = ##class(%DeepSee.CubeManager.Utils).SetActiveRegistry("Cube.Registry")
    Quit:$$$ISERR(tSC) tSC

    Set tSC = ##class(%DeepSee.CubeManager.Utils).BuildAllRegisteredGroups()
    Quit:$$$ISERR(tSC) tSC

    // To work with Community, it must be < 10240 (10Gb)
    Quit ..ExpandDB(10000)
}

ClassMethod ExpandDB(pSizeInMb As %Integer)
{
    Set tSC = $$$OK 
    Set tNS = $Namespace 
    Try 
    { 
      Set $Namespace="%SYS" 
      Set tSC = ##class(Config.Databases).Get("USER", .properties)
      Quit:$$$ISERR(tSC)
      
      Set dir=properties("Directory")
      Set db=##class(SYS.Database).%OpenId(dir,,.tSC)
      Quit:$$$ISERR(tSC)
      Set db.Size=pSizeInMb 
      Set tSC = db.%Save()
      
    } 
    Catch (oException) 
    { 
      Set tSC = oException.AsStatus() 
    }

    Set $Namespace=tNS 

    Quit tSC
}

XData ProductionDefinition
{
<Production Name="IRISDemo.Production" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Trace Operation" Category="" ClassName="IRISDemo.BO.Trace.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Ens.Alert" Category="" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Mortgage Transactions Data Service" Category="" ClassName="EnsLib.RecordMap.Service.BatchFileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="RecordMap">Staging.RM.MortgageTrans</Setting>
    <Setting Target="Host" Name="SynchronousSend">1</Setting>
    <Setting Target="Host" Name="TargetConfigNames">Normalization Process</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/MortgageSystemFiles/Trans/Done/</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="ConfirmComplete">1</Setting>
    <Setting Target="Adapter" Name="FilePath">/MortgageSystemFiles/Trans/In/</Setting>
    <Setting Target="Host" Name="BatchClass">Staging.RM.MortgageTrans.Batch</Setting>
    <Setting Target="Host" Name="BatchHandling">Whole</Setting>
    <Setting Target="Adapter" Name="CallInterval">1</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.csv</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">1</Setting>
  </Item>
  <Item Name="Mortgage Affordability Data Service" Category="" ClassName="EnsLib.RecordMap.Service.BatchFileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="RecordMap">Staging.RM.MortgageAfford</Setting>
    <Setting Target="Host" Name="SynchronousSend">1</Setting>
    <Setting Target="Host" Name="TargetConfigNames">Normalization Process</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/MortgageSystemFiles/Afford/Done/</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="ConfirmComplete">1</Setting>
    <Setting Target="Adapter" Name="FilePath">/MortgageSystemFiles/Afford/In/</Setting>
    <Setting Target="Host" Name="BatchClass">Staging.RM.MortgageAfford.Batch</Setting>
    <Setting Target="Host" Name="BatchHandling">Whole</Setting>
    <Setting Target="Adapter" Name="CallInterval">1</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.csv</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">1</Setting>
  </Item>
  <Item Name="Mortgage Performance Data Service" Category="" ClassName="EnsLib.RecordMap.Service.BatchFileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="RecordMap">Staging.RM.MortgagePerf</Setting>
    <Setting Target="Host" Name="SynchronousSend">1</Setting>
    <Setting Target="Host" Name="TargetConfigNames">Normalization Process</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/MortgageSystemFiles/Perf/Done/</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="ConfirmComplete">1</Setting>
    <Setting Target="Adapter" Name="FilePath">/MortgageSystemFiles/Perf/In/</Setting>
    <Setting Target="Host" Name="BatchClass">Staging.RM.MortgagePerf.Batch</Setting>
    <Setting Target="Host" Name="BatchHandling">Whole</Setting>
    <Setting Target="Adapter" Name="CallInterval">1</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.csv</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">1</Setting>
  </Item>
  <Item Name="Normalization Process" Category="" ClassName="Normalization.Process" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Data Stewards" Category="" ClassName="EnsLib.Workflow.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AutoCreateRole">1</Setting>
  </Item>
  <Item Name="Cube Operations" Category="" ClassName="Cube.BO.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="Report Service" Category="" ClassName="Report.BS.Service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Reporting Process" Category="" ClassName="Report.BP.Process" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="Send to FCA" Category="" ClassName="Custom.FCAReport.BO.XMLFileReport.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/FCAGeneratedReports/</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Host" Name="Filename">%f_%Q.xml</Setting>
    <Setting Target="Host" Name="Format">intC()</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">E=R</Setting>
  </Item>
  <Item Name="Hyperledger Reporting Operation" Category="" ClassName="Hyperledger.BO.ReportingOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="%gatewayPort">55555</Setting>
  </Item>
  <Item Name="Java Gateway" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="Gate used for running Hyperledger Pex Adapter" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="JVMArgs">-Xmx2048m</Setting>
  </Item>
</Production>
}

}
