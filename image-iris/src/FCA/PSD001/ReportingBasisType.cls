/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/CommonTypes/v10/CommonTypes-Schema.xsd
Class FCA.PSD001.ReportingBasisType Extends %String [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter MAXLEN;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAHSFFeedMG-v2";

Parameter VALUELIST = ",unconsolidated,solo-consolidated,UK consolidation group,banking conglomerate,investment conglomerate,UK integrated group,DLG by default,UK DLG by modification,Non-UK DLG by modification";

}
