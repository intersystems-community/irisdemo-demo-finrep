/// Defines a string type that may not be the empty string. Values of this type are also whitespace normalized meaning all-whitespace strings are also invalid.
/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/CommonTypes/v10/CommonTypes-Schema.xsd
Class FCA.PSD007.NonEmptyString Extends %String [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter MAXLEN;

Parameter MINLEN = 1;

Parameter NAMESPACE = "urn:fsa-gov-uk:MER:PSD007:2";

}
