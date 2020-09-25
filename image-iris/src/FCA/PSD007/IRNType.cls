/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/CommonTypes/v10/CommonTypes-Schema.xsd
Class FCA.PSD007.IRNType Extends %String [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter MAXLEN;

Parameter NAMESPACE = "urn:fsa-gov-uk:MER:PSD007:2";

Parameter XMLPATTERN = "[A-Z]{3}[0-9]{5}";

}