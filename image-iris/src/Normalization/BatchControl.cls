Class Normalization.BatchControl Extends (%Persistent, %XML.Adaptor)
{

Property FileName As %String(MAXLEN = "") [ Required ];

Property BatchClassName As %String(MAXLEN = 256) [ Required ];

Property CreationDate As %TimeStamp [ InitialExpression = {$ZDateTime($ZTimeStamp,3)}, Required ];

Property LastProcessingStatus As %String(DISPLAYLIST = ",Processing,Error,Discarded,Done", VALUELIST = ",1,2,3,7") [ InitialExpression = 1, Required ];

Property LastControlRecord As Normalization.BatchControlRecord(XMLPROJECTION = "NONE");

Index BatchFileNameIndex On (BatchClassName, FileName) [ Unique ];

Index LastBatchProcessingStatusIndex On (BatchClassName, LastProcessingStatus);

ClassMethod OpenOrCreate(pBatchClassName As %String, pFileName As %String, Output pStatus As %Status) As Normalization.BatchControl
{
    Set pStatus = $$$OK

    Set oBatch = ##class(Normalization.BatchControl).BatchFileNameIndexOpen(pBatchClassName, pFileName)
    If oBatch = ""
    {
        Set oBatch = ..%New()
        Set oBatch.FileName=pFileName
        Set oBatch.BatchClassName=pBatchClassName
    }

    Quit oBatch
}

Storage Default
{
<Data name="BatchControlDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FileName</Value>
</Value>
<Value name="3">
<Value>BatchClassName</Value>
</Value>
<Value name="4">
<Value>CreationDate</Value>
</Value>
<Value name="5">
<Value>LastProcessingStatus</Value>
</Value>
<Value name="6">
<Value>LastControlRecord</Value>
</Value>
</Data>
<DataLocation>^Normalization.BatchControlD</DataLocation>
<DefaultData>BatchControlDefaultData</DefaultData>
<IdLocation>^Normalization.BatchControlD</IdLocation>
<IndexLocation>^Normalization.BatchControlI</IndexLocation>
<StreamLocation>^Normalization.BatchControlS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
