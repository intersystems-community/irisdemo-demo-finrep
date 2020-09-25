/// FSA Reference Number. Either a 6 or 7 digit number.  Leading zeroes are not expected.
/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/PSD-CommonTypes/v1.2/FSAFeedCommon-v1-2.xsd
Class FCA.PSD001.cmn.FSARefType Extends %String [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter MAXLEN;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAFeedCommon-v1-2";

Parameter XMLPATTERN = "[1-9]{1}[0-9]{5,6}";

}
