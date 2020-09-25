/// Method of Premium/Contribution payment. Single or Regular.
/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/PSD-CommonTypes/v1.2/FSAFeedCommon-v1-2.xsd
Class FCA.PSD001.cmn.PremiumPaymentMethodType Extends %String [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter MAXLEN;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAFeedCommon-v1-2";

Parameter VALUELIST = ",S,R";

}
