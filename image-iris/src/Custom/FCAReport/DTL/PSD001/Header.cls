Class Custom.FCAReport.DTL.PSD001.Header Extends Ens.DataTransformDTL [ DependsOn = (Report.ReportScheduleRun, EnsLib.EDI.XML.Document) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Report.ReportScheduleRun' targetClass='EnsLib.EDI.XML.Document' targetDocType='psd001-schema-v2-2:FSAHSFFeedMG' create='new' language='objectscript' >
<assign value='$Piece(source.LastStatusChange," ")' property='target.{FSAFeedHeader.ReportDetails.ReportCreationDate}' action='set' />
<assign value='source.ReportSchedule.Report.ReportCode _"/"_source.%Id()' property='target.{FSAFeedHeader.ReportDetails.ReportIdentifier}' action='set' />
<assign value='"DemoFirm"' property='target.{FSAFeedHeader.Submitter.SubmittingFirm}' action='set' />
<assign value='"DemoDept"' property='target.{FSAFeedHeader.Submitter.SubmittingDept}' action='set' />
<assign value='"2.0"' property='target.{FSAFeedHeader.FeedTargetSchemaVersion}' action='set' />
</transform>
}

}
