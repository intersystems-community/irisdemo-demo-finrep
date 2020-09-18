Class Custom.FCAReport.DTL.PSD001.FSAHSFFeedMGMsg Extends Ens.DataTransformDTL [ DependsOn = (Canonical.Mortgage, EnsLib.EDI.XML.Document) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Canonical.Mortgage' targetClass='EnsLib.EDI.XML.Document' targetDocType='psd001-schema-v2-2:FSAHSFFeedMG' create='existing' language='objectscript' >
<assign value='"test"' property='target.{FSAHSFFeedMGMsg().CoreItems.FirmFSARef}' action='set' key='"1"' />
</transform>
}

}
