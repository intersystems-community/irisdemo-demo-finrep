/// 
Class Cube.BatchControlRecord Extends %DeepSee.CubeDefinition [ DependsOn = Normalization.BatchControlRecord, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="BatchControlRecord" displayName="Batches" disabled="false" abstract="false" sourceClass="Normalization.BatchControlRecord" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="ProcessingStatus" disabled="false" hasAll="false" allCaption="All ProcessingStatus" allDisplayName="ProcessingStatus" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="ProcessingStatus" disabled="false" sourceProperty="ProcessingStatus" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="BatchType" displayName="Batch Type" disabled="false" hasAll="false" allCaption="All BatchClassName" allDisplayName="BatchClassName" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="BatchType" displayName="Batch Type" disabled="false" sourceExpression="$Piece($Piece(%source.BatchControl.BatchClassName,&quot;Staging.RM.&quot;,*),&quot;.Batch&quot;,1)" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="CreationDate" disabled="false" hasAll="false" allCaption="All CreationDate" allDisplayName="CreationDate" sourceProperty="CreationDate" type="time" calendar="gregorian" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="CreationMonth" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
      <level name="CreationDate" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
    </hierarchy>
  </dimension>
  <measure name="NumberOfRecordsProcessed" disabled="false" sourceProperty="NumberOfRecordsProcessed" aggregate="SUM" type="number" hidden="false" searchable="false" factNumber="1">
  </measure>
  <listing name="Listing" disabled="false" listingType="table" fieldList="SessionId,BatchControl-&gt;BatchClassName AS &quot;&quot;Batch&quot;&quot;,CanonicalClassName,CreationDate,LastStatusChange,NumberOfRecordsProcessed,ProcessingStatus,Reason,DTLClassName">
  </listing>
</cube>
}

Parameter DOMAIN;

}
