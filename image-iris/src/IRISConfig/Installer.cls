Include %occInclude

Class IRISConfig.Installer Extends IRISConfig.InstallerBase
{

ClassMethod ConfigIRIS() As %Status
{
	Set tSC = $$$OK
	Try
	{
		Set tSC=##Class(Config.config).Get(.Properties)
		Quit:$$$ISERR(tSC)

		// the default is 262144Kb (256*1024 = 256Mb). 
		// I am increasing it to 1024Mb
		Set Properties("bbsiz")=1024*1024

		#; Set Properties("wduseasyncio")=0  //to test durable %SYS with docker-compose on my mac
		#; Set Properties("Asyncwij")=0      //to test durable %SYS with docker-compose on my mac
		Set Properties("jrnbufs")=128
		Set Properties("gmheap")=1048576

		Set tSC=##Class(Config.config).Modify(.Properties)
		Quit:$$$ISERR(tSC)

		DO ##class(Security.SSLConfigs).Create("SSLCLIENT")

		Set MapGlobalsProperties("Database")="IRISTEMP"
		Set tSC=##Class(Config.MapGlobals).Create("USER","CTCache",.MapGlobalsProperties)
	}
	Catch (oException)
	{
		Set tSC = oException.AsStatus()
	}	
		
	Quit tSC
}

ClassMethod DisableJournalForDatabase(pDatabaseName As %String) As %Status
{
	Set tSC = $$$OK
	Try
	{
		Set tSC = ##class(Config.Databases).Get(pDatabaseName, .v)
		Quit:$$$ISERR(tSC)

		Set tDatabaseDir = v("Directory")

		Set db=##Class(SYS.Database).%OpenId(tDatabaseDir)
		Set db.GlobalJournalState=2

		Set tSC = db.%Save()
	}
	Catch (oException)
	{
		Set tSC = oException.AsStatus()
	}	
		
	Quit tSC
}

/// We are not using VDocs anymore. But I have left this code here in order to be able to reproduce the 
/// speed problems we found.
ClassMethod LoadFCAXMLSchemas(pNamespace As %String) As %Status
{
	Set tSC = $$$OK
	Try
	{
		ZN pNamespace

		Set tSC = ##class(EnsLib.EDI.XML.SchemaXSD).ImportFiles("/tmp/FCASchemas/CommonTypes-Schema.xsd")
		Quit:$$$ISERR(tSC)

		Set tSC = ##class(EnsLib.EDI.XML.SchemaXSD).ImportFiles("/tmp/FCASchemas/FSAFeedCommon-v1-2.xsd")
		Quit:$$$ISERR(tSC)

		Set tSC = ##class(EnsLib.EDI.XML.SchemaXSD).ImportFiles("/tmp/FCASchemas/PSD007-Schema.xsd")
		Quit:$$$ISERR(tSC)

		Set tSC = ##class(EnsLib.EDI.XML.SchemaXSD).ImportFiles("/tmp/FCASchemas/psd001-schema-v2-2.xsd")
		Quit:$$$ISERR(tSC)

	}
	Catch (oException)
	{
		Set tSC = oException.AsStatus()
	}	
	
	ZN "%SYS"

	Quit tSC
}

/*
/// We have manually loaded the schemas as IRIS classes using routine ^ManuallyLoadFCASchemas and then
/// we have exported the classes from IRIS into our VSCode project so we don't need to rely on Gabriel
/// anymore to build the demo.
ClassMethod LoadFCAXMLSchemasAsClasses() As %Status
{
	Set tSC = $$$OK
	Try
	{
		ZN "APPINT"

		Set reader = ##class(%XML.Utils.SchemaReader).%New()
		Set reader.MakeNamespace=1
		Set reader.IndexRelationship=1
		Set reader.CascadeDeletes=1

		Set tSC = reader.Process("/tmp/FCASchemas/CommonTypes-Schema.xsd","FCA.CommonTypes")
		Quit:$$$ISERR(tSC)

		Set tSC = reader.Process("/tmp/FCASchemas/FSAFeedCommon-v1-2.xsd","FCA.FSAFeedCommonV12")
		Quit:$$$ISERR(tSC)

		Set tSC = reader.Process("/tmp/FCASchemas/psd001-schema-v2-2.xsd","FCA.PSD001")
		Quit:$$$ISERR(tSC)

		Set tSC = reader.Process("/tmp/FCASchemas/PSD007-Schema.xsd","FCA.PSD007")
		Quit:$$$ISERR(tSC)


	}
	Catch (oException)
	{
		Set tSC = oException.AsStatus()
	}	
	
	ZN "%SYS"

	Quit tSC
}
*/
ClassMethod LoadDFIFiles(pNamespace As %String) As %Status
{
	Set tSC = $$$OK
	Try
	{
		ZN pNamespace

		Set tSC = ##class(%DeepSee.UserLibrary.Utils).%Import("/tmp/dfi/pivot.dfi", 1, 1)		
		Quit:$$$ISERR(tSC)

		Set tSC = ##class(%DeepSee.UserLibrary.Utils).%Import("/tmp/dfi/FCA-Report Status/pivot.dfi", 1, 1)		
		Quit:$$$ISERR(tSC)
 
		Set tSC = ##class(%DeepSee.UserLibrary.Utils).%Import("/tmp/dfi/FCA-FCA Reporting Monitoring/dashboard.dfi", 1, 1)		
		Quit:$$$ISERR(tSC)

	}
	Catch (oException)
	{
		Set tSC = oException.AsStatus()
	}	
	
	ZN "%SYS"

	Quit tSC
}

ClassMethod ConfigDemo(pNamespace As %String) As %Status
{
	Set tSC = $$$OK
	Try
	{
		ZN pNamespace
		
		//Set ^normMetrics=1
		//Set ^reportMetrics=1

		Set obj = ##class(Normalization.BatchJobSpec).%New()
		Set obj.BatchClassName="Staging.RM.MortgageTrans.Batch"
		Set obj.BatchRecordClassName="Staging.RM.MortgageTrans.Record"
		Set obj.DTLClassName="Custom.Normalization.DTL.Trans"
		Set obj.CanonicalClassName="Canonical.Mortgage"
		Set obj.ValidationRuleName="Custom.Normalization.Rule.Trans"
		Set obj.CubeList="BatchControlRecord,MortgageSales"
		Set tSC = obj.%Save()
		Quit:$$$ISERR(tSC)

		Set obj = ##class(Normalization.BatchJobSpec).%New()
		Set obj.BatchClassName="Staging.RM.MortgageAfford.Batch"
		Set obj.BatchRecordClassName="Staging.RM.MortgageAfford.Record"
		Set obj.DTLClassName="Custom.Normalization.DTL.Afford"
		Set obj.CanonicalClassName="Canonical.MortgageAfford"
		Set obj.CubeList="BatchControlRecord,MortgageSales"
		//Set obj.ValidationRuleName="Custom.Normalization.Rule.Afford"
		Set tSC = obj.%Save()
		Quit:$$$ISERR(tSC)

		Set obj = ##class(Normalization.BatchJobSpec).%New()
		Set obj.BatchClassName="Staging.RM.MortgagePerf.Batch"
		Set obj.BatchRecordClassName="Staging.RM.MortgagePerf.Record"
		Set obj.DTLClassName="Custom.Normalization.DTL.Perf"
		Set obj.CanonicalClassName="Canonical.MortgagePerf"
		//Set obj.ValidationRuleName="Custom.Normalization.Rule.Perf"
		Set obj.CubeList="BatchControlRecord,MortgageSales"
		Set tSC = obj.%Save()
		Quit:$$$ISERR(tSC)

		
		// FCA Report spec and Schedule for Mortgage sales data. These will be assigned ID 1
		Set objReport = ##class(Report.ReportDef).%New()
		Set objReport.ReportName="FCA PSD 001 v2.2"
		Set objReport.ReportCode="PSD001v2.2"
		Set objReport.HeaderDTL="Custom.FCAReport.DTL.PSD001.Header"
		Set objReport.ContentsDTL="Custom.FCAReport.DTL.PSD001.Msg"
		Set objReport.ReportQuery="select ID from Canonical.Mortgage where %BatchRecordStatus=7 and AsOfDate >= TO_DATE(?, 'YYYY-MM-DD') and AsOfDate < TO_DATE(?, 'YYYY-MM-DD')"
		Set objReport.SourceCanonicalClassName="Canonical.Mortgage"
		Set objReport.ReportClassName="FCA.PSD001.FSAHSFFeedMG"
		Set objReport.CubeList="Reports"
		Set tSC = objReport.%Save()
		Quit:$$$ISERR(tSC)

		Set objReportSch = ##class(Report.ReportSchedule).%New()
		Set objReportSch.Report=objReport
		Set objReportSch.DueDate=$ZDateH("2020-04-20", 3) // The law gives up to 20 days to the institution to send the report
		Do objReportSch.QueryParamList.Insert("2020-01-01") //Inclusive
		Do objReportSch.QueryParamList.Insert("2020-04-01") //Exclusive
		Set tSC = objReportSch.%Save()
		Quit:$$$ISERR(tSC)

		// FCA Report spec and Schedule for Mortgage performance data. These will be assigned ID 2
		Set objReport = ##class(Report.ReportDef).%New()
		Set objReport.ReportName="FCA PSD 007 v2"
		Set objReport.ReportCode="PSD007v2"
		Set objReport.HeaderDTL="Custom.FCAReport.DTL.PSD007.Header"
		Set objReport.ContentsDTL="Custom.FCAReport.DTL.PSD007.Msg"
		Set objReport.ReportQuery="select main.ID from Canonical.MortgagePerf main where main.%BatchRecordStatus=7 and main.AsOfDate = (select max(sub.AsOfDate) from Canonical.MortgagePerf sub where main.Mortgage=sub.Mortgage and sub.AsOfDate >= TO_DATE(?, 'YYYY-MM-DD') and sub.AsOfDate < TO_DATE(?, 'YYYY-MM-DD') and sub.%BatchRecordStatus=7)"
		Set objReport.SourceCanonicalClassName="Canonical.MortgagePerf"
		Set objReport.ReportClassName="FCA.PSD007.PSD007MortgagePerformanceSalesData"
		Set objReport.CubeList="Reports"
		Set tSC = objReport.%Save()
		Quit:$$$ISERR(tSC)

		Set objReportSch = ##class(Report.ReportSchedule).%New()
		Set objReportSch.Report=objReport
		Set objReportSch.DueDate=$ZDateH("2020-07-20", 3) // The law gives up to 20 days to the institution to send the report
		Do objReportSch.QueryParamList.Insert("2020-01-01") //Inclusive
		Do objReportSch.QueryParamList.Insert("2020-07-01") //Exclusive
		Set tSC = objReportSch.%Save()
		Quit:$$$ISERR(tSC)


	}
	Catch (oException)
	{
		Set tSC = oException.AsStatus()
	}	
	
	ZN "%SYS"
	
	Quit tSC
}

ClassMethod InsertOnLookupTable(pNamespace As %String, pLookupName As %String, pKey As %String, pValue As %String) As %Status
{
	Set tSC = $$$OK
	Try
	{
		ZN pNamespace

		TStart
		
		Set ^Ens.LookupTable(pLookupName)=$ListBuild($Horolog)
		
		Set ^Ens.LookupTable(pLookupName, pKey)=pValue
		
		Set ^IRISDemo.BS.LookupTable("PopulatedTables", pLookupName)=$ListBuild($H)
	}
	Catch (oException)
	{
		Set tSC = oException.AsStatus()
	}
	
	If $System.Status.IsError(tSC)
	{
		TRollback
	}
	Else
	{
		TCommit
	}

	ZN "%SYS"
	
	Quit tSC
}

ClassMethod PopulateLookupTables(pNamespace As %String) As %Status
{
	#define IL(%LT,%K,%V) Set tSC = ..InsertOnLookupTable(pNamespace, %LT, %K, %V) Q:$$$ISERR(tSC)

	Set tSC = $$$OK
	Try
	{		
		$$$IL("ReasonForClosure", "Remortgage to same lender", "R")
		$$$IL("ReasonForClosure", "Moved to a different property, mortgage taken with same lender (includes porting)", "M")
		$$$IL("ReasonForClosure", "Repossession", "P")
		$$$IL("ReasonForClosure", "Assisted sale", "A")
		$$$IL("ReasonForClosure", "Voluntary repossession", "V")
		$$$IL("ReasonForClosure", "Other", "O")

		$$$IL("ReasonForClosure", " remortgage to same lender", "R")
		$$$IL("ReasonForClosure", " moved to a different property, mortgage taken with same lender (includes porting)", "M")
		$$$IL("ReasonForClosure", " repossession", "P")
		$$$IL("ReasonForClosure", " assisted sale ", "A")
		$$$IL("ReasonForClosure", " voluntary repossession", "V")
		$$$IL("ReasonForClosure", " other", "O")

	}
	Catch (oException)
	{
		Set tSC = oException.AsStatus()
	}	
	
	ZN "%SYS"
	
	Quit tSC
}

ClassMethod PopulateCT(pNamespace As %String) As %Status
{
	#define I(%T,%C,%D) Set tSC = ..InsertOnCT(%T, %C, %D) Q:$$$ISERR(tSC)

	Set tSC = $$$OK
	Try
	{
		ZN pNamespace
		
		$$$I("TypeDwelling", "B", "Bungalow")
		$$$I("TypeDwelling", "D", "Detached house")
		$$$I("TypeDwelling", "S", "Semi-detached house")
		$$$I("TypeDwelling", "T", "Terraced house")
		$$$I("TypeDwelling", "F", "Flat or maisonette in converted house")
		$$$I("TypeDwelling", "P", "Purpose built flat or maisonette")
		$$$I("TypeDwelling", "O", "Other")

		$$$I("TypeIntRate", "01", "Fixed rate")
		$$$I("TypeIntRate", "02", "Discounted variable rate")
		$$$I("TypeIntRate", "03", "Tracker")
		$$$I("TypeIntRate", "04", "Capped rate")
		$$$I("TypeIntRate", "05", "Standard variable rate")
		$$$I("TypeIntRate", "06", "Bank of England base rate tracker")
		$$$I("TypeIntRate", "07", "LIBOR tracker")
		$$$I("TypeIntRate", "08", "Other tracker")
		$$$I("TypeIntRate", "99", "Other")
		
		$$$I("MtgeType", "L", "Lifetime mortgage")
		$$$I("MtgeType", "SA", "Shared appreciation mortgage")
		$$$I("MtgeType", "SO", "Shared ownership mortgage")
		$$$I("MtgeType", "BM", "Business loan")
		$$$I("MtgeType", "BL", "Bridging loan")
		$$$I("MtgeType", "GM", "Guarantor mortgage")
		$$$I("MtgeType", "HN", "Loan to a high net worth mortgage customer")
		$$$I("MtgeType", "BR", "Buy-to-let mortgage (regulated)")
		$$$I("MtgeType", "LO", "Low start mortgage")
		$$$I("MtgeType", "SB", "Self-build mortgage")
		$$$I("MtgeType", "SE", "Secured overdraft")
		$$$I("MtgeType", "SC", "Second charge regulated mortgage contract")
		$$$I("MtgeType", "VN", "Contract variation with no affordability assessment")
		$$$I("MtgeType", "RI", "Retirement interest-only mortgage")
		$$$I("MtgeType", "NA", "Not applicable")

		$$$I("TypeReversionRate", "01", "Fixed rate")
		$$$I("TypeReversionRate", "02", "Discount")
		$$$I("TypeReversionRate", "04", "Capped rate")
		$$$I("TypeReversionRate", "05", "Standard variable rate")
		$$$I("TypeReversionRate", "06", "Bank of England base rate tracker ")
		$$$I("TypeReversionRate", "07", "LIBOR tracker")
		$$$I("TypeReversionRate", "08", "Other tracker ")
		$$$I("TypeReversionRate", "98", "Not applicable")
		$$$I("TypeReversionRate", "99", "Other")
		
		$$$I("ValuationType", "I", "Internal inspection")
		$$$I("ValuationType", "E", "External inspection only, including drive-by")
		$$$I("ValuationType", "A", "Automated valuation model, indexed or desktop valuation")
		$$$I("ValuationType", "O", "Other")

		$$$I("RemtgePurpose", "N", "No extra money raised,")
		$$$I("RemtgePurpose", "H", "Extra money raised for home improvements,")
		$$$I("RemtgePurpose", "D", "Extra money raised for debt consolidation,")
		$$$I("RemtgePurpose", "M", "Extra money raised for home improvements and debt consolidation,")
		$$$I("RemtgePurpose", "O", "Other")
		
		$$$I("MainEmpStatus", "E", "Employed")
		$$$I("MainEmpStatus", "S", "Self-Employed")
		$$$I("MainEmpStatus", "R", "Retired,")
		$$$I("MainEmpStatus", "O", "Other")
		
		
		$$$I("BorrowerType", "F", "First time buyer")
		$$$I("BorrowerType", "M", "Home movers (2nd or subsequent buyers)")
		$$$I("BorrowerType", "R", "Remortgagors")
		$$$I("BorrowerType", "C", "Council/registered social landlord tenant exercising their right to buy")
		$$$I("BorrowerType", "O", "Other")
		$$$I("BorrowerType", "N", "Not known")
		
		$$$I("RepayMethod", "C", "Capital and interest")
		$$$I("RepayMethod", "M", "Mix of 'capital and interest' and 'interest only'")
		$$$I("RepayMethod", "I", "Interest only / ISA")
		$$$I("RepayMethod", "P", "Interest only / pension")
		$$$I("RepayMethod", "U", "Interest only / unknown")
		$$$I("RepayMethod", "E", "Interest only / endowment")
		$$$I("RepayMethod", "N", "Not known")


		$$$I("IncomeBasis", "S", "Sole income")
		$$$I("IncomeBasis", "J", "Joint income")


		$$$I("IncomeVerification", "Y", "Income evidenced by lender")
		$$$I("IncomeVerification", "N", "No")
		$$$I("IncomeVerification", "O", "Iincome evidenced by third party")

		$$$I("MCOBUsed", "Y", "Yes, to existing borrower")
		$$$I("MCOBUsed", "T", "Yes, to new borrower")
		$$$I("MCOBUsed", "N", "No")


		$$$I("MtgeChar", "CB", "Cashback")
		$$$I("MtgeChar", "FF", "Flexible features (allowing overpayments and underpayments)")
		$$$I("MtgeChar", "OS", "Offset positive and negative balances")
		$$$I("MtgeChar", "EL", "A second charge regulated mortgage contract that is a shared equity credit agreement")
		$$$I("MtgeChar", "RM", "A remortgage under MCOB 11.9 which does not extend into retirement")
		$$$I("MtgeChar", "RR", "A remortgage under MCOB 11.9 which extends into retirement")
		$$$I("MtgeChar", "L", "The loan is a lifetime mortgage")
		$$$I("MtgeChar", "SA", "The loan is a shared appreciation mortgage")
		$$$I("MtgeChar", "SE", "Mortgage with shared equity scheme loan attached")
		$$$I("MtgeChar", "MI", "Mortgage with indemnity insurance attached ")
		$$$I("MtgeChar", "NA", "Not applicable")

		$$$I("BorrowerImpCredHist", "A", "Arrears")
		$$$I("BorrowerImpCredHist", "V", "IVA")
		$$$I("BorrowerImpCredHist", "B", "Bankruptcy")
		$$$I("BorrowerImpCredHist", "D", "Debt relief order")
		$$$I("BorrowerImpCredHist", "NA", "Not applicable")


		$$$I("HowSaleMade", "F", "Direct face-to-face")
		$$$I("HowSaleMade", "T", "Direct telephone")
		$$$I("HowSaleMade", "E", "Direct internet")
		$$$I("HowSaleMade", "P", "Direct post")
		$$$I("HowSaleMade", "O", "Direct other")
		$$$I("HowSaleMade", "I", "Intermediary")


		$$$I("RepaymentStrategy", "E", "Endowment")
		$$$I("RepaymentStrategy", "P", "Pension")
		$$$I("RepaymentStrategy", "S", "Savings or investments (other than endowments and pensions)")
		$$$I("RepaymentStrategy", "M", "Sale of mortgaged property")
		$$$I("RepaymentStrategy", "B", "Sale of other property (e.g. buy-to-let or second home)")
		$$$I("RepaymentStrategy", "A", "Sale of other asset")
		$$$I("RepaymentStrategy", "C", "Occasional payments from income")
		$$$I("RepaymentStrategy", "R", "Repaid by capital and interest (for low start mortgages)")
		$$$I("RepaymentStrategy", "F", "Refinancing (for bridging loans)")
		$$$I("RepaymentStrategy", "L", "Lifetime mortgage")
		$$$I("RepaymentStrategy", "O", "Other repayment strategy")

		//Performance tables

		$$$I("ReasonForClosure", "R", "Remortgage to same lender")
		$$$I("ReasonForClosure", "M", "Moved to a different property, mortgage taken with same lender (includes porting)")
		$$$I("ReasonForClosure", "P", "Repossession")
		$$$I("ReasonForClosure", "A", "Assisted sale ")
		$$$I("ReasonForClosure", "V", "Voluntary repossession")
		$$$I("ReasonForClosure", "O", "Other")
	}
	Catch (oException)
	{
		Set tSC = oException.AsStatus()
	}	
	
	ZN "%SYS"
	
	Quit tSC
}

ClassMethod InsertOnCT(pShortClassName As %String, pCode As %String, pDescription As %String) As %Status
{
	Set result = ##class(%SQL.Statement).%ExecDirect(, "insert or update into Canonical_CT."_pShortClassName_" (Code, Description) values (?,?)", pCode, pDescription)

	If result.%SQLCODE<0
	{
		Quit $$$ERROR(5001, result.%Message)
	}

	Quit $$$OK
}

/// You can customize this to run code during docker build
XData Install [ XMLNamespace = INSTALLER ]
{
<Manifest>
	
	<Namespace Name="${Namespace}" Create="no">
		<IfDef Var="SourceDir">
            <Log Text="SourceDir defined - offline install from ${SourceDir}" Level="0"/>
            <Import File="${SourceDir}" Recurse="true"/>
        </IfDef>

		<CSPApplication Url="/csp/report/" Directory="/FCAGeneratedReports" Recurse="true" AuthenticationMethods="#{##class(IRISConfig.Installer).AuthForSMP()}" IsNamespaceDefault="false" CookiePath="/csp/${CSPAppName}" AutoCompile="false" Grant="AppRole" CSPZENEnabled="true" InboundWebServicesEnabled="false" GroupById="%ISCMgtPortal" Resource="%Ens_Portal"/>
	</Namespace>
		
	<Log Text="Adding workflow role for demo..." Level="0"/>
	<Invoke Class="IRISConfig.Installer" Method="AddWFRole" CheckStatus="true">
		<Arg name="pNamespace" Value="${Namespace}"/>
		<Arg name="pRoleName" Value="Data Stewards"/>
	</Invoke>
		
	<Log Text="Adding workflow user for demo..." Level="0"/>
	<Invoke Class="IRISConfig.Installer" Method="AddWFUser" CheckStatus="true">
		<Arg name="pNamespace" Value="${Namespace}"/>
		<Arg name="pUserName" Value="SuperUser"/>
		<Arg name="pFullName" Value="Mr Anderson"/>
		<Arg name="pRoleName" Value="Data Stewards"/>
	</Invoke>
	
	<Log Text="Configuring IRIS for demo..." Level="0"/>
	<Invoke Class="IRISConfig.Installer" Method="ConfigDemo" CheckStatus="true">
		<Arg name="pNamespace" Value="${Namespace}"/>
	</Invoke>

	<Log Text="Populating canonical code tables for the demo..." Level="0"/>
	<Invoke Class="IRISConfig.Installer" Method="PopulateCT" CheckStatus="true">
		<Arg name="pNamespace" Value="${Namespace}"/>
	</Invoke>

	<Log Text="Populating lookup tables for the demo..." Level="0"/>
	<Invoke Class="IRISConfig.Installer" Method="PopulateLookupTables" CheckStatus="true">
		<Arg name="pNamespace" Value="${Namespace}"/>
	</Invoke>

	<Log Text="Configuring IRIS..." Level="0"/>
	<Invoke Class="IRISConfig.Installer" Method="ConfigIRIS" CheckStatus="true">
	</Invoke>

	<Log Text="Loading DeepSee Pivots and Dashboards..." Level="0"/>
	<Invoke Class="IRISConfig.Installer" Method="LoadDFIFiles" CheckStatus="true">
		<Arg name="pNamespace" Value="${Namespace}"/>
	</Invoke>

	<Log Text="Disabling journal for demo..." Level="0"/>
	<Invoke Class="IRISConfig.Installer" Method="DisableJournalForDatabase" CheckStatus="true">
		<Arg name="pNamespace" Value="${Namespace}"/>
	</Invoke>


</Manifest>
}

}
