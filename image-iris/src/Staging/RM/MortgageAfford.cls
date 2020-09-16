/// RECORDMAP: Modified during compilation of RecordMap 'Staging.RM.MortgageAfford'
/// on 2020-09-14 at 17:41:09.822 [2020-09-14 17:41:09.822 UTC]
/// by user SuperUser
Class Staging.RM.MortgageAfford Extends EnsLib.RecordMap.RecordMap
{

Parameter OBJECTNAME = "Staging.RM.MortgageAfford.Record";

/// Method to retrieve a record from a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod GetObject(pStream As %IO.DeviceStream, Output pObject As %RegisteredObject, pTimeout As %Numeric = -1, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status
{
	Try {
		Set tStatus = $$$OK
		Set pObject = $$$NULLOREF
		If '$IsObject(pStream) {
			Set tFilename = pStream
			Set pStream = ##class(%IO.FileStream).%New()
			Do pStream.Open(tFilename,,pTimeout,"UTF-8", .tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tObjectName = $parameter($this,"OBJECTNAME")
		Set tObject = $classmethod(tObjectName,"%New")
		If '$IsObject(tObject) {
			Set tStatus = $$$ERROR($$$CannotCreateObject,tObjectName)
			Quit
		}
		Set tObject.%Source = pStream.Name
		Set tGetTopFields = $parameter(tObject,"INCLUDETOPFIELDS")
		If pStream.AtEnd && (""=pLookAhead) {
			Set tStatus = $$$ERROR($$$EnsRecordMapErrStreamAtEnd, pStream.Name)
			Quit
		}
		Set pStream.CharEncoding = "UTF-8"

		#; Parse incoming stream
		Set tStatus = ..GetRecord(pStream, tObject, tGetTopFields, pTimeout, .pLookAhead, pLabelFound)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	If $$$ISERR(tStatus) { Set pObject = $$$NULLOREF }
	Else { Set pObject = tObject }
	Quit tStatus
}

/// Method to write a record to a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod PutObject(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pFlush As %Boolean = 1, ByRef pPadArray As %String) As %Status
{
	Try {
		Set tStatus = $$$OK
		If '$IsObject(pStream) {
			Set tFilename = pStream
			Set pStream = ##class(%IO.FileStream).%New()
			Do pStream.Open(tFilename,"WAE",,"UTF-8", .tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tHasTopFields = $parameter(pObject,"INCLUDETOPFIELDS")
		Set pStream.CharEncoding = "UTF-8"

		Set tStatus = ..PutRecord(pStream, pObject, tHasTopFields, .pPadArray)
		If $$$ISERR(tStatus) Quit
		If pFlush Do pStream.Flush(.tStatus)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	Quit tStatus
}

/// Internal helper method to perform parse of incoming data
ClassMethod GetRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pGetTopFields As %Boolean, pTimeout As %Numeric, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	If pLabelFound { Set tRecLabel = "" } 
	Else { Set tRecLabel = "" } 
	Set tStatus = ..chunkRecord(pStream, .tRecordData, .tCharCount, "", pTimeout, $char(13,10), tRecLabel, .pLookAhead, "")
	If $$$ISERR(tStatus) Quit tStatus
	Set tMaxLocal = $$$MaxLocalLength
	Set tRecordData("charcount") = +$get(tCharCount)
	Set tCurrChunk = 1
	Set tTopPiece = 1
	Set tCurrSep = 1
	Set tStrings = 1
	Set tCurrString = ""
	Set tSeps = $listbuild($char(44))
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Else {
		Set tCurrString = tRecordData(tCurrChunk)
		Set tCurrPiece = 1
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyAsOfDate = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyFirmId = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyTransId = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyGrossIncome = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyDwellingTyp = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyNumBedrooms = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRemtgePurpose = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyIncomeVerification = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeProtection = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPrimaryEmpStatus = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacySecondaryEmpStatus = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyNumHabitableRooms = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyGarage = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMCOBUsed = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyNumBorrowersAssessed = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyNumDependentAdults = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyNumDependChildren = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPrimaryRetireAge = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacySecondaryRetireAge = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPrimaryGrossPay = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPrimaryGrossOtherIncomeEmploy = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPrimaryGrossIncomeSelfEmploy = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPrimaryGrossOtherIncome = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacySecondaryGrossPay = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacySecondaryGrossIncomeEmploy = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacySecondaryGrossSelfEmploy = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacySecondaryGrossOtherIncome = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyTertiaryGrossPay = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyTertiaryGrossIncomeEmploy = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyTertiaryGrossSelfEmploy = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyTertiaryGrossOtherIncome = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPrimaryTotalVerifiedIncme = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacySecondaryTotalVerifiedNetIncome = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyTertiaryTotalVerifiedNetIncome = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyTotalOutstandingCredits = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMonthlyExpenditure = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyBasicExpenditure = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyStressTestedInterestRate = tCurrString
	}
	Quit tStatus
}

/// Internal helper method to output object to a stream
ClassMethod PutRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pHasTopFields As %Boolean, ByRef pPadArray As %String) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	Do pStream.Write($select(pHasTopFields: pObject.LegacyAsOfDate,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyFirmId,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyTransId,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyGrossIncome,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyDwellingTyp,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyNumBedrooms,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRemtgePurpose,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyIncomeVerification,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeProtection,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPrimaryEmpStatus,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacySecondaryEmpStatus,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyNumHabitableRooms,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyGarage,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMCOBUsed,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyNumBorrowersAssessed,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyNumDependentAdults,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyNumDependChildren,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPrimaryRetireAge,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacySecondaryRetireAge,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPrimaryGrossPay,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPrimaryGrossOtherIncomeEmploy,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPrimaryGrossIncomeSelfEmploy,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPrimaryGrossOtherIncome,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacySecondaryGrossPay,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacySecondaryGrossIncomeEmploy,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacySecondaryGrossSelfEmploy,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacySecondaryGrossOtherIncome,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyTertiaryGrossPay,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyTertiaryGrossIncomeEmploy,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyTertiaryGrossSelfEmploy,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyTertiaryGrossOtherIncome,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPrimaryTotalVerifiedIncme,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacySecondaryTotalVerifiedNetIncome,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyTertiaryTotalVerifiedNetIncome,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyTotalOutstandingCredits,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMonthlyExpenditure,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyBasicExpenditure,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyStressTestedInterestRate,1: ""),0)
	Do pStream.Write($char(13,10), 0, .tStatus)
	If $$$ISERR(tStatus) Quit tStatus
	Quit tStatus
}

ClassMethod GetGeneratedClasses(Output pClasses As %String) As %Status
{
	Kill pClasses
	Set pClasses("Staging.RM.MortgageAfford.Batch")=""
	Set pClasses("Staging.RM.MortgageAfford.Record")=""
	Set pClasses($classname())=""
	Quit $$$OK
}

ClassMethod getIdentifier() As %String [ CodeMode = expression ]
{
""
}

ClassMethod getType() As EnsLib.RecordMap.Model.DataType.RecordType [ CodeMode = expression ]
{
"delimited"
}

XData RecordMap [ XMLNamespace = "http://www.intersystems.com/Ensemble/RecordMap" ]
{
<Record xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="Staging.RM.MortgageAfford" type="delimited" char_encoding="UTF-8" targetClassname="Staging.RM.MortgageAfford.Record" batchClass="Staging.RM.MortgageAfford.Batch" complexBatchManaged="0" padFromLeft="0" recordTerminator="\x0d\x0a" allowEarlyTerminator="0">
  <Separators>
    <Separator>,</Separator>
  </Separators>
  <Field name="LegacyAsOfDate" datatype="%String" sqlColumn="2">
  </Field>
  <Field name="LegacyFirmId" datatype="%String" sqlColumn="3">
  </Field>
  <Field name="LegacyTransId" datatype="%String" sqlColumn="4">
  </Field>
  <Field name="LegacyGrossIncome" datatype="%String" sqlColumn="5">
  </Field>
  <Field name="LegacyDwellingTyp" datatype="%String" sqlColumn="6">
  </Field>
  <Field name="LegacyNumBedrooms" datatype="%String" sqlColumn="7">
  </Field>
  <Field name="LegacyRemtgePurpose" datatype="%String" sqlColumn="8">
  </Field>
  <Field name="LegacyIncomeVerification" datatype="%String" sqlColumn="9">
  </Field>
  <Field name="LegacyMtgeProtection" datatype="%String" sqlColumn="10">
  </Field>
  <Field name="LegacyPrimaryEmpStatus" datatype="%String" sqlColumn="11">
  </Field>
  <Field name="LegacySecondaryEmpStatus" datatype="%String" sqlColumn="12">
  </Field>
  <Field name="LegacyNumHabitableRooms" datatype="%String" sqlColumn="13">
  </Field>
  <Field name="LegacyGarage" datatype="%String" sqlColumn="14">
  </Field>
  <Field name="LegacyMCOBUsed" datatype="%String" sqlColumn="15">
  </Field>
  <Field name="LegacyNumBorrowersAssessed" datatype="%String" sqlColumn="16">
  </Field>
  <Field name="LegacyNumDependentAdults" datatype="%String" sqlColumn="17">
  </Field>
  <Field name="LegacyNumDependChildren" datatype="%String" sqlColumn="18">
  </Field>
  <Field name="LegacyPrimaryRetireAge" datatype="%String" sqlColumn="19">
  </Field>
  <Field name="LegacySecondaryRetireAge" datatype="%String" sqlColumn="20">
  </Field>
  <Field name="LegacyPrimaryGrossPay" datatype="%String" sqlColumn="21">
  </Field>
  <Field name="LegacyPrimaryGrossOtherIncomeEmploy" datatype="%String" sqlColumn="22">
  </Field>
  <Field name="LegacyPrimaryGrossIncomeSelfEmploy" datatype="%String" sqlColumn="23">
  </Field>
  <Field name="LegacyPrimaryGrossOtherIncome" datatype="%String" sqlColumn="24">
  </Field>
  <Field name="LegacySecondaryGrossPay" datatype="%String" sqlColumn="25">
  </Field>
  <Field name="LegacySecondaryGrossIncomeEmploy" datatype="%String" sqlColumn="26">
  </Field>
  <Field name="LegacySecondaryGrossSelfEmploy" datatype="%String" sqlColumn="27">
  </Field>
  <Field name="LegacySecondaryGrossOtherIncome" datatype="%String" sqlColumn="28">
  </Field>
  <Field name="LegacyTertiaryGrossPay" datatype="%String" sqlColumn="29">
  </Field>
  <Field name="LegacyTertiaryGrossIncomeEmploy" datatype="%String" sqlColumn="30">
  </Field>
  <Field name="LegacyTertiaryGrossSelfEmploy" datatype="%String" sqlColumn="31">
  </Field>
  <Field name="LegacyTertiaryGrossOtherIncome" datatype="%String" sqlColumn="32">
  </Field>
  <Field name="LegacyPrimaryTotalVerifiedIncme" datatype="%String" sqlColumn="33">
  </Field>
  <Field name="LegacySecondaryTotalVerifiedNetIncome" datatype="%String" sqlColumn="34">
  </Field>
  <Field name="LegacyTertiaryTotalVerifiedNetIncome" datatype="%String" sqlColumn="35">
  </Field>
  <Field name="LegacyTotalOutstandingCredits" datatype="%String" sqlColumn="36">
  </Field>
  <Field name="LegacyMonthlyExpenditure" datatype="%String" sqlColumn="37">
  </Field>
  <Field name="LegacyBasicExpenditure" datatype="%String" sqlColumn="38">
  </Field>
  <Field name="LegacyStressTestedInterestRate" datatype="%String" sqlColumn="39">
  </Field>
</Record>
}

}
