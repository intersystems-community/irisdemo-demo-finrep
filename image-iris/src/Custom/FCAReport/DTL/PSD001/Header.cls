Class Custom.FCAReport.DTL.PSD001.Header Extends Ens.DataTransformDTL [ DependsOn = (Report.ReportScheduleRun, EnsLib.EDI.XML.Document) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Report.ReportScheduleRun' targetClass='FCA.PSD001.FSAHSFFeedMG' create='new' language='objectscript' >
<assign value='$ZDateH($Piece(source.LastStatusChange," "),3)' property='target.FSAFeedHeader.ReportDetails.ReportCreationDate' action='set' />
<assign value='source.ReportSchedule.Report.ReportCode _"/"_source.%Id()' property='target.FSAFeedHeader.ReportDetails.ReportIdentifier' action='set' />
<assign value='12345' property='target.FSAFeedHeader.Submitter.SubmittingFirm' action='set' />
<assign value='123' property='target.FSAFeedHeader.Submitter.SubmittingDept' action='set' />
<assign value='"2.0"' property='target.FSAFeedHeader.FeedTargetSchemaVersion' action='set' />
</transform>
}

}
