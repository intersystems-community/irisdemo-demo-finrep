/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/CommonTypes/v10/CommonTypes-Schema.xsd
Class FCA.PSD001.IRNType Extends %String [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter MAXLEN;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAHSFFeedMG-v2";

Parameter XMLPATTERN = "[A-Z]{3}[0-9]{5}";

}
