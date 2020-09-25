/// Integer from 1 to 999999999. Representing sterling-equivalent amount.
/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/PSD-CommonTypes/v1.2/FSAFeedCommon-v1-2.xsd
Class FCA.PSD001.cmn.HSFStdSterlingAmountType Extends %xsd.positiveInteger [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAFeedCommon-v1-2";

Parameter XMLTotalDigits = 9;

}
