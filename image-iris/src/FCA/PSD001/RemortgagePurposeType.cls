/// Purpose of re-mortgage.
/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/PSD001/v2/psd001-schema-v2-2.xsd
Class FCA.PSD001.RemortgagePurposeType Extends %String [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter MAXLEN;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAHSFFeedMG-v2";

Parameter VALUELIST = ",N,H,D,M,O";

}
