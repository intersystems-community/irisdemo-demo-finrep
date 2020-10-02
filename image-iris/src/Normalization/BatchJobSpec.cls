/// Matches the name of a batch class to what to do with it:
/// 1 - What DTL to apply to each record
/// 2 - Which table in the canonical model will the DTL be populating with data so that the 
///     process can update records's BatchRecordReplaced to true when a batch replaces records from a 
///     previous batch.
/// 3 - What Cubes to build after the DTLs have been applied
Class Normalization.BatchJobSpec Extends %Persistent
{

/// The name of the batch class used to group the records
Property BatchClassName As %String(MAXLEN = 256) [ Required ];

/// The name of the batch record class used on the batch
Property BatchRecordClassName As %String(MAXLEN = 256) [ Required ];

/// The DTL that must be used to transform records on the bath into records in the canonical model
Property DTLClassName As %String(MAXLEN = 256) [ Required ];

/// The name of the class where the DTL is leaving the records. The normalization process needs to use this
/// in order to be able to update BatchRecordReplaced property with true when a record in the canonical table
/// is replaced by a new batch of records. We don't delete records from the canonical model unless the 
/// batch is Discarded. 
Property CanonicalClassName As %String(MAXLEN = 256) [ Required ];

/// List of cubes that need to be synchronized after a batch is successfully loaded.
Property CubeList As %String(MAXLEN = 32000) [ Required ];

Index BatchClassNameIndex On BatchClassName [ Unique ];

Method GetSQLCursorForBatch(pParentBatchId As %String, ByRef status As %Status) As %ResultSet
{
    Set status = $$$OK
    Set oRS = ""
    Try 
    {
        Set tTableName = $Translate($Piece(..BatchRecordClassName,".",1,*-1),".","_")
        Set tTableName = tTableName_"."_$Piece(..BatchRecordClassName,".",*)
        
        Set oRS = ##class(%ResultSet).%New()

        Set status = oRS.Prepare("select ID from "_tTableName_" where %ParentBatch=?")
        Quit:$$$ISERR(status)

        Set status = oRS.Execute(pParentBatchId)
    }
    Catch (oException)
    {
        Set status = oException.AsStatus()
    }
    Quit oRS
}

Storage Default
{
<Data name="BatchJobSpecDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>BatchClassName</Value>
</Value>
<Value name="3">
<Value>BatchRecordClassName</Value>
</Value>
<Value name="4">
<Value>DTLClassName</Value>
</Value>
<Value name="5">
<Value>CanonicalClassName</Value>
</Value>
<Value name="6">
<Value>CubeList</Value>
</Value>
</Data>
<DataLocation>^Normalization.BatchJobSpecD</DataLocation>
<DefaultData>BatchJobSpecDefaultData</DefaultData>
<IdLocation>^Normalization.BatchJobSpecD</IdLocation>
<IndexLocation>^Normalization.BatchJobSpecI</IndexLocation>
<StreamLocation>^Normalization.BatchJobSpecS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
