/// 
Class Cube.Reports Extends %DeepSee.CubeDefinition [ DependsOn = Report.ReportSchedule, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="Reports" displayName="Reports" disabled="false" abstract="false" sourceClass="Report.ReportSchedule" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="ScheduleStatus" disabled="false" hasAll="false" allCaption="All ScheduleStatus" allDisplayName="ScheduleStatus" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="ScheduleStatus" disabled="false" sourceProperty="ScheduleStatus" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="DueDate" disabled="false" hasAll="false" allCaption="All DueDate" allDisplayName="DueDate" sourceProperty="DueDate" type="time" calendar="gregorian" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="DueDate" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
      <level name="DueDay" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="ReportName" disabled="false" hasAll="false" allCaption="All ReportName" allDisplayName="ReportName" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="ReportName" disabled="false" sourceProperty="Report.ReportName" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
    </hierarchy>
  </dimension>
  <listing name="Listing" disabled="false" listingType="table" fieldList="LastRun-&gt;SessionId,Report-&gt;ReportName,ScheduleStatus,LastRun-&gt;RunStatus,LastRun-&gt;Reason,LastRun-&gt;LastStatusChange,DueDate">
  </listing>
</cube>
}

Parameter DOMAIN;

}
