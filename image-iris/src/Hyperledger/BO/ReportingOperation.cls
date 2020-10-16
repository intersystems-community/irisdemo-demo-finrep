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

		Set reportObjTree = $classmethod(pRequest.ReportClassName, "%OpenId", pRequest.GeneratedReportObjectId,, .tSC)
		Quit:$$$ISERR(tSC)

		Set pResponse = ##class(Hyperledger.BO.CreateReportTransactionResp).%New()

		If pRequest.ReportClassName = "FCA.PSD001.FSAHSFFeedMG" {
			Set ReportHeader = reportObjTree.FSAFeedHeader
			Set Identifier = ReportHeader.ReportDetails.ReportIdentifier

			For i=1:1:reportObjTree.FSAHSFFeedMGMsg.Count() {  
				if i < 5{
					Set FeedMSGTree = reportObjTree.FSAHSFFeedMGMsg.GetAt(i)
					Set tSC = FeedMSGTree.XMLExportToString(.XMLContentString)
					Quit:$$$ISERR(tSC)

					Set TransactionReq = ##class(Hyperledger.BO.CreateReportTransactionReq).%New()

					Set TransactionReq.ReportIdentifier = ReportHeader.ReportDetails.ReportIdentifier_"-"_FeedMSGTree.%Id()
					Set TransactionReq.ReportCreationDate = $ZDATETIME(ReportHeader.ReportDetails.ReportCreationDate, 3, 1)
					Set TransactionReq.SubmittingFirm = ReportHeader.Submitter.SubmittingFirm
					Set TransactionReq.SubmittingDepartment = ReportHeader.Submitter.SubmittingDept
					Set TransactionReq.ReportContent = XMLContentString

					$$$TRACE("Sending PSD001 To Hyperledger For Storage. Report Identifier: "_TransactionReq.ReportIdentifier)
					Do ..Adapter.SubmitReport(TransactionReq) 
				}
			}
		}
		ElseIf pRequest.ReportClassName = "FCA.PSD007.PSD007MortgagePerformanceSalesData" {
			Set ReportHeader = reportObjTree.PSDFeedHeader
			Set Identifier = ReportHeader.ReportDetails.ReportIdentifier

			For i=1:1:reportObjTree.PSD007FeedMsg.Count() {  
				if i < 5{
					Set FeedMSGTree = reportObjTree.PSD007FeedMsg.GetAt(i)
					Set tSC = FeedMSGTree.XMLExportToString(.XMLContentString)
					Quit:$$$ISERR(tSC)

					Set TransactionReq = ##class(Hyperledger.BO.CreateReportTransactionReq).%New()

					Set TransactionReq.ReportIdentifier = ReportHeader.ReportDetails.ReportIdentifier_"-"_FeedMSGTree.%Id()
					Set TransactionReq.ReportCreationDate = $ZDATETIME(ReportHeader.ReportDetails.ReportCreationDate, 3, 1)
					Set TransactionReq.SubmittingFirm = ReportHeader.Submitter.SubmittingFirm
					Set TransactionReq.SubmittingDepartment = "N/A"
					Set TransactionReq.ReportContent = XMLContentString

					$$$TRACE("Sending PSD007 To Hyperledger For Storage. Report Identifier: "_TransactionReq.ReportIdentifier)
					Do ..Adapter.SubmitReport(TransactionReq) 
				}
			}
		}

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
