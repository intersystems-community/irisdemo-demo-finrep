Class Custom.FCAReport.DTL.PSD007.Header Extends Ens.DataTransformDTL [ DependsOn = (Canonical.Mortgage, EnsLib.EDI.XML.Document) ]
{

/// DTL Definition.
XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform targetClass='EnsLib.EDI.XML.Document' targetDocType='PSD007-Schema:PSD007-MortgagePerformanceSalesData' sourceClass='Canonical.Mortgage' sourceDocType='' create='new' language='objectscript'>
</transform>
}

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

}
