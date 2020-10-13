Include DEMOMACROS

Class Hyperledger.BO.ReportingOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "Hyperledger.Adapter.HyperledgerOutboundAdapter";

Parameter INVOCATION = "Queue";

Property Adapter As Hyperledger.Adapter.HyperledgerOutboundAdapter;

Method SaveReport(pRequest As Report.ReportScheduleRun, Output pResponse As Hyperledger.BO.CreatePSD001Resp) As %Status
{
	#dim reportTreeObject AS FCA.PSD001.FSAHSFFeedMG
  	Set tSC = $$$OK
	Try 
	{

		Set reportObjTree = $classmethod(pRequest.ReportClassName, "%OpenId", pRequest.GeneratedReportObjectId,, .tSC)
		Quit:$$$ISERR(tSC)

		Set ReportHeader = reportObjTree.FSAFeedHeader

		Set tSQL="SELECT TOP 5 ID FROM FCA_PSD001.FSAHSFFeedMGMsg WHERE FSAHSFFeedMG="_pRequest.GeneratedReportObjectId
		Set oRS = ##class(%SQL.Statement).%ExecDirect(, tSQL)
		$$$ThrowSQLExceptionIfResultError(oRS, "FSAHSFFeedMGMsg SQL Exception")
		
		While oRS.%Next()
		{
			Set msgID = oRS.%Get("ID")
			Set FeedMSGTree = ##class(FCA.PSD001.FSAHSFFeedMGMsg).%OpenId(msgID)
			Set tSC = FeedMSGTree.XMLExportToString(.XMLContentString)
			Quit:$$$ISERR(tSC)

			Set pResponse = ##class(Hyperledger.BO.CreatePSD001Resp).%New()

			Set pResponse.ReportIdentifier = ReportHeader.ReportDetails.ReportIdentifier_"-"_msgID
			Set pResponse.ReportCreationDate = $ZDATETIME(ReportHeader.ReportDetails.ReportCreationDate, 3, 1)
			Set pResponse.SubmittingFirm = ReportHeader.Submitter.SubmittingFirm
			Set pResponse.SubmittingDepartment = ReportHeader.Submitter.SubmittingDept
			Set pResponse.ReportContent = XMLContentString

			$$$TRACE("Sending PSD001 To Hyperledger For Storage. Report Identifier: "_pResponse.ReportIdentifier)
			Set s = ..Adapter.TestAdapter(pResponse)
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
  <MapItem MessageType="Report.ReportScheduleRun">
    <Method>SaveReport</Method>
  </MapItem>
</MapItems>
}

}
