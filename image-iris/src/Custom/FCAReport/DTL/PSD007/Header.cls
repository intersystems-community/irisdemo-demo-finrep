Class Custom.FCAReport.DTL.PSD007.Header Extends Ens.DataTransformDTL [ DependsOn = (Report.ReportScheduleRun, FCA.PSD007.PSD007MortgagePerformanceSalesData) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Report.ReportScheduleRun' targetClass='FCA.PSD007.PSD007MortgagePerformanceSalesData' create='new' language='objectscript' >
<assign value='$ZDateH($Piece(source.LastStatusChange," "),3)' property='target.PSDFeedHeader.ReportDetails.ReportCreationDate' action='set' />
<assign value='source.ReportSchedule.Report.ReportCode _"/"_source.%Id()' property='target.PSDFeedHeader.ReportDetails.ReportIdentifier' action='set' />
<assign value='12345' property='target.PSDFeedHeader.Submitter.SubmittingFirm' action='set' />
</transform>
}

}
