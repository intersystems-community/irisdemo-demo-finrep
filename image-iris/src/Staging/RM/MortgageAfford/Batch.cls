/// RECORDMAP: Modified during compilation of RecordMap 'Staging.RM.MortgageAfford'
/// on 2020-09-14 at 17:41:09.797 [2020-09-14 17:41:09.797 UTC]
/// by user SuperUser
Class Staging.RM.MortgageAfford.Batch Extends (%Library.Persistent, EnsLib.RecordMap.SimpleBatch)
{

Parameter XMLNAME = "Staging_RM_MortgageAfford_Batch";

Parameter RECORDMAPGENERATED = 1;

Parameter BatchHeader;

Parameter HeaderTerm = "\x0d\x0a";

Parameter BatchTrailer;

Parameter TrailerTerm = "\x0d\x0a";

Parameter IgnoreLeadingData = 1;

Relationship Records As Staging.RM.MortgageAfford.Record [ Cardinality = many, Inverse = %ParentBatch ];

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ..deleteRecords({ID})
}

Parameter XMLTYPE = "Staging_RM_MortgageAfford_Batch";

Storage Default
{
<Data name="BatchDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>%Source</Value>
</Value>
<Value name="3">
<Value>BatchHeader</Value>
</Value>
<Value name="4">
<Value>BatchTrailer</Value>
</Value>
</Data>
<DataLocation>^Staging.RM.MortgageA36F8.BatchD</DataLocation>
<DefaultData>BatchDefaultData</DefaultData>
<IdLocation>^Staging.RM.MortgageA36F8.BatchD</IdLocation>
<IndexLocation>^Staging.RM.MortgageA36F8.BatchI</IndexLocation>
<StreamLocation>^Staging.RM.MortgageA36F8.BatchS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
