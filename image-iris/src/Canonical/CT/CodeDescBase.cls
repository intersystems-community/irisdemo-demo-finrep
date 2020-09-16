Class Canonical.CT.CodeDescBase Extends (%Persistent, %XML.Adaptor) [ NoExtent ]
{

Property Code As %String [ Required ];

Property Description As %String(MAXLEN = 200) [ Required ];

Index CodeIndex On Code [ PrimaryKey ];

Projection NormalizedDataProjection As Normalization.NormalizedDataProjection(CODETABLE = 1, UTILITYFUNCTIONPREFIX = "CT");

}
