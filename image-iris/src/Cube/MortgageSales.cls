/// 
Class Cube.MortgageSales Extends %DeepSee.CubeDefinition [ DependsOn = Canonical.Mortgage, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="MortgageSales" displayName="MortgageSales" disabled="false" abstract="false" sourceClass="Canonical.Mortgage" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="GovtInitiative" disabled="false" hasAll="false" allCaption="All GovtInitiative" allDisplayName="GovtInitiative" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="GovtInitiative" disabled="false" sourceProperty="GovtInitiative" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="HowSalesMade" disabled="false" hasAll="false" allCaption="All Description" allDisplayName="Description" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="HowSalesMade" disabled="false" sourceProperty="HowSaleMade.Description" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="ValuationType" disabled="false" hasAll="false" allCaption="All ValuationType" allDisplayName="ValuationType" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="ValuationType" disabled="false" sourceProperty="ValuationType.Description" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="AcctOpenDate" disabled="false" hasAll="false" allCaption="All AcctOpenDate" allDisplayName="AcctOpenDate" sourceProperty="AcctOpenDate" type="time" calendar="gregorian" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="AcctOpenDateYear" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
      <level name="AcctOpenDateMonth" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="6">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="HasGarage" disabled="false" hasAll="false" allCaption="All HasGarage" allDisplayName="HasGarage" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="HasGarage" disabled="false" sourceProperty="Affordability.HasGarage" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="7">
      </level>
    </hierarchy>
  </dimension>
  <measure name="PurchasePrice" disabled="false" sourceProperty="PurchasePrice" aggregate="SUM" type="number" hidden="false" searchable="false" factNumber="1">
  </measure>
</cube>
}

Parameter DOMAIN;

}
