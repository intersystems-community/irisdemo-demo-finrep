/// Y or N
/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/PSD-CommonTypes/v1.2/FSAFeedCommon-v1-2.xsd
Class FCA.PSD001.cmn.YNType Extends %String [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter MAXLEN;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAFeedCommon-v1-2";

Parameter VALUELIST = ",Y,N";

}
