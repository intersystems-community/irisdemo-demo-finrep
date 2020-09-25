/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/CommonTypes/v10/CommonTypes-Schema.xsd
Class FCA.PSD001.YearType Extends %Integer [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAHSFFeedMG-v2";

Parameter XMLPATTERN = "[1-2][0-9]{3}";

}
