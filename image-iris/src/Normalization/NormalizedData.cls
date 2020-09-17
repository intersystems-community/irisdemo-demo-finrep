Class Normalization.NormalizedData Extends (%Persistent, %XML.Adaptor) [ NoExtent ]
{

/// For data lineage
Property %BatchControlRecord As Normalization.BatchControlRecord;

/// For data lineage
Property %OriginalBatchRecordId As %String;

/// For logical deletes. Cubes should not consider this record when building
Property %BatchRecordStatus As %String(DISPLAYLIST = ",Processing,Error,Discarded,Available,Replaced", VALUELIST = ",1,2,3,7,9") [ InitialExpression = 1, Required ];

/// For populating support functions for using on DTL
Projection NormalizedDataProjection As Normalization.NormalizedDataProjection;

Index BatchControlRecordIndex On %BatchControlRecord;

Index BatchRecordStatusIndex On %BatchRecordStatus;

Method Touch() As %Status
{
    Set %LastChanged = $ZDateTime($ZTimeStamp,3)

    Quit $$$OK
}

ClassMethod ChangeBatchRecordStatus(pBatchControlRecordId As %String, pBatchRecordStatus As %Integer) As %Status [ CodeMode = objectgenerator ]
{
    Quit:%class.Name="Normalization.NormalizedData" $$$OK
    
    Set tSqlTableName=%class.SqlTableName
    If tSqlTableName="" 
    {
        Set tSqlTableName=$Piece(%class.Name,".",*)
    }
    Set tSqlSchema = $Piece(%class.Name,".",1,*-1)
    If tSqlSchema="User"
    {
        Set tSqlSchema="SQLUser"
    }
    Else {
        Set tSqlSchema=$Translate(tSqlSchema,".","_")
    }
    

    Set tTableName=tSqlSchema_"."_tSqlTableName

    Do %code.WriteLine(" Set oRS = ##class(%ResultSet).%New()")
    Do %code.WriteLine(" Set tSC = oRS.Prepare(""update %NOLOCK "_tTableName_" set %BatchRecordStatus=? where %BatchControlRecord=?"")")
    Do %code.WriteLine(" Quit:$$$ISERR(tSC) tSC")
    Do %code.WriteLine(" Set tSC = oRS.Execute(pBatchRecordStatus, pBatchControlRecordId)")
    Do %code.WriteLine(" Quit tSC")
    
    Quit $$$OK
}

}
