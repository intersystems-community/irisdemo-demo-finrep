/// RECORDMAP: Modified during compilation of RecordMap 'Staging.RM.MortgagePerf'
/// on 2020-09-23 at 21:34:40.386 [2020-09-23 21:34:40.386 UTC]
/// by user SuperUser
Class Staging.RM.MortgagePerf.Batch Extends (%Library.Persistent, EnsLib.RecordMap.SimpleBatch)
{

Parameter XMLNAME = "Staging_RM_MortgagePerf_Batch";

Parameter RECORDMAPGENERATED = 1;

Parameter BatchHeader;

Parameter HeaderTerm = "\x0d\x0a";

Parameter BatchTrailer;

Parameter TrailerTerm = "\x0d\x0a";

Parameter IgnoreLeadingData = 1;

Relationship Records As Staging.RM.MortgagePerf.Record [ Cardinality = many, Inverse = %ParentBatch ];

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ..deleteRecords({ID})
}

Parameter XMLTYPE = "Staging_RM_MortgagePerf_Batch";

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
<DataLocation>^Staging.RM.MortgagePerf.BatchD</DataLocation>
<DefaultData>BatchDefaultData</DefaultData>
<IdLocation>^Staging.RM.MortgagePerf.BatchD</IdLocation>
<IndexLocation>^Staging.RM.MortgagePerf.BatchI</IndexLocation>
<StreamLocation>^Staging.RM.MortgagePerf.BatchS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
