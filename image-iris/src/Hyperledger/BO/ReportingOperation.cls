Include DEMOMACROS

Class Hyperledger.BO.ReportingOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "Hyperledger.Adapter.HyperledgerOutboundAdapter";

Parameter INVOCATION = "Queue";

Property Adapter As Hyperledger.Adapter.HyperledgerOutboundAdapter;

Method SaveReport(pRequest As Report.ReportScheduleRun, Output pResponse As Hyperledger.BO.CreateReportTransactionResp) As %Status
{
  	Set tSC = $$$OK
	Try 
	{
		Set ReportURLBase = "http://host.docker.internal:10000/csp/user/rest/data/"

		Set reportObjTree = $classmethod(pRequest.ReportClassName, "%OpenId", pRequest.GeneratedReportObjectId,, .tSC)
		Quit:$$$ISERR(tSC)

		Set pResponse = ##class(Hyperledger.BO.CreateReportTransactionResp).%New()

		If pRequest.ReportClassName = "FCA.PSD001.FSAHSFFeedMG" {
			Set ReportHeader = reportObjTree.FSAFeedHeader
		}
		ElseIf pRequest.ReportClassName = "FCA.PSD007.PSD007MortgagePerformanceSalesData" {
			Set ReportHeader = reportObjTree.PSDFeedHeader
		}

		Set TransactionReq = ##class(Hyperledger.BO.CreateReportTransactionReq).%New()
		Set Identifier = ReportHeader.ReportDetails.ReportIdentifier

		Set TransactionReq.ReportIdentifier = Identifier
		Set TransactionReq.ReportCreationDate = $ZDATETIME(ReportHeader.ReportDetails.ReportCreationDate, 3, 1)
		Set TransactionReq.SubmittingFirm = ReportHeader.Submitter.SubmittingFirm
		Set TransactionReq.ReportURL = ReportURLBase_""_pRequest.ReportClassName_"/"_pRequest.GeneratedReportObjectId

		$$$TRACE("Sending Mortgage Reporting Asset For Storage. Report Identifier: "_Identifier)
		Do ..Adapter.SubmitReport(TransactionReq)

		Set pResponse.ReportSaveStatus =  "Report: "_Identifier_" Saved Successfully!"
	} 
	Catch (oException)
	{
		Set tSC = oException.AsStatus()  
		Set pResponse.ReportSaveStatus = "Report: "_Identifier_" Failed!: Error: "_oException.DisplayString()
	}

	Quit tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Report.ReportScheduleRun">
    <Method>SaveReport</Method>
  </MapItem>
</MapItems>
}

}
