/// RECORDMAP: Modified during compilation of RecordMap 'Staging.RM.MortgageTrans'
/// on 2020-09-14 at 17:42:22.400 [2020-09-14 17:42:22.400 UTC]
/// by user SuperUser
Class Staging.RM.MortgageTrans Extends EnsLib.RecordMap.RecordMap
{

Parameter OBJECTNAME = "Staging.RM.MortgageTrans.Record";

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
		Set pObject.LegacyAcctOpen = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyBorrowerType = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyLoanAmt = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPrimaryDOB = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacySecondaryDOB = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPrimaryBorrowerCCJValue = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacySecondaryBorrowerCCJValue = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyInitialGrossIntRate = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPrincipalOrNetworkFirmId = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeCharacteristic1 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeCharacteristic2 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeCharacteristic3 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeCharacteristic4 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeCharacteristic5 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyIntRateType = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPropertyValue = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPrimaryBorrowerCrdHist1 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPrimaryBorrowerCrdHist2 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPrimaryBorrowerCrdHist3 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPrimaryBorrowerCrdHist4 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacySecondaryBorrowerCrdHist1 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacySecondaryBorrowerCrdHist2 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacySecondaryBorrowerCrdHist3 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacySecondaryBorrowerCrdHist4 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyIncentiveRateEndDate = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyNewDwelling = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyAdvisedSale = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPropertyPostCode = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeTerm = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPurchasePrice = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyIncomeBasis = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyERCEndDate = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyHowSaleMade = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyReversionRateType = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyGovtInitiative = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRepayMethod = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRepayStrat1 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRepayStrat2 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRepayStrat3 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRepayStrat4 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRepayStrat5 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRepayStrat6 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRepayStrat7 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRepayStrat8 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRepayStrat9 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRepayStrat10 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRepayStrat11 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPercentageIO = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyInterestRollUp = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyValuationType = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMoneyWithdrawn = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyDebtConsolidationAmt = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyEarlyRepaymentCharge = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyCurrency = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyCustomerPct = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyTotalLoanAvailable = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyLenderFee = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyIntermediaryFee = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyProcurationFee = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyTotalFeesCharges = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeType1 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeType2 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeType3 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeType4 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeType5 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeType6 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeType7 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeType8 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeType9 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeType10 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMtgeType11 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRemtgePurpose1 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRemtgePurpose2 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRemtgePurpose3 = tCurrString
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
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyAcctOpen,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyBorrowerType,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyLoanAmt,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPrimaryDOB,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacySecondaryDOB,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPrimaryBorrowerCCJValue,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacySecondaryBorrowerCCJValue,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyInitialGrossIntRate,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPrincipalOrNetworkFirmId,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeCharacteristic1,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeCharacteristic2,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeCharacteristic3,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeCharacteristic4,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeCharacteristic5,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyIntRateType,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPropertyValue,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPrimaryBorrowerCrdHist1,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPrimaryBorrowerCrdHist2,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPrimaryBorrowerCrdHist3,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPrimaryBorrowerCrdHist4,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacySecondaryBorrowerCrdHist1,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacySecondaryBorrowerCrdHist2,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacySecondaryBorrowerCrdHist3,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacySecondaryBorrowerCrdHist4,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyIncentiveRateEndDate,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyNewDwelling,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyAdvisedSale,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPropertyPostCode,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeTerm,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPurchasePrice,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyIncomeBasis,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyERCEndDate,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyHowSaleMade,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyReversionRateType,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyGovtInitiative,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRepayMethod,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRepayStrat1,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRepayStrat2,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRepayStrat3,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRepayStrat4,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRepayStrat5,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRepayStrat6,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRepayStrat7,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRepayStrat8,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRepayStrat9,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRepayStrat10,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRepayStrat11,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyPercentageIO,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyInterestRollUp,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyValuationType,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMoneyWithdrawn,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyDebtConsolidationAmt,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyEarlyRepaymentCharge,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyCurrency,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyCustomerPct,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyTotalLoanAvailable,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyLenderFee,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyIntermediaryFee,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyProcurationFee,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyTotalFeesCharges,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeType1,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeType2,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeType3,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeType4,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeType5,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeType6,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeType7,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeType8,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeType9,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeType10,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyMtgeType11,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRemtgePurpose1,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRemtgePurpose2,1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: pObject.LegacyRemtgePurpose3,1: ""),0)
	Do pStream.Write($char(13,10), 0, .tStatus)
	If $$$ISERR(tStatus) Quit tStatus
	Quit tStatus
}

ClassMethod GetGeneratedClasses(Output pClasses As %String) As %Status
{
	Kill pClasses
	Set pClasses("Staging.RM.MortgageTrans.Batch")=""
	Set pClasses("Staging.RM.MortgageTrans.Record")=""
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
<Record xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="Staging.RM.MortgageTrans" type="delimited" char_encoding="UTF-8" targetClassname="Staging.RM.MortgageTrans.Record" batchClass="Staging.RM.MortgageTrans.Batch" complexBatchManaged="0" padFromLeft="0" recordTerminator="\x0d\x0a" allowEarlyTerminator="0">
  <Separators>
    <Separator>,</Separator>
  </Separators>
  <Field name="LegacyAsOfDate" datatype="%String" sqlColumn="2">
  </Field>
  <Field name="LegacyFirmId" datatype="%String" sqlColumn="3">
  </Field>
  <Field name="LegacyTransId" datatype="%String" sqlColumn="4">
  </Field>
  <Field name="LegacyAcctOpen" datatype="%String" sqlColumn="5">
  </Field>
  <Field name="LegacyBorrowerType" datatype="%String" sqlColumn="6">
  </Field>
  <Field name="LegacyLoanAmt" datatype="%String" sqlColumn="7">
  </Field>
  <Field name="LegacyPrimaryDOB" datatype="%String" sqlColumn="8">
  </Field>
  <Field name="LegacySecondaryDOB" datatype="%String" sqlColumn="9">
  </Field>
  <Field name="LegacyPrimaryBorrowerCCJValue" datatype="%String" sqlColumn="10">
  </Field>
  <Field name="LegacySecondaryBorrowerCCJValue" datatype="%String" sqlColumn="11">
  </Field>
  <Field name="LegacyInitialGrossIntRate" datatype="%String" sqlColumn="12">
  </Field>
  <Field name="LegacyPrincipalOrNetworkFirmId" datatype="%String" sqlColumn="13">
  </Field>
  <Field name="LegacyMtgeCharacteristic1" datatype="%String" sqlColumn="14">
  </Field>
  <Field name="LegacyMtgeCharacteristic2" datatype="%String" sqlColumn="15">
  </Field>
  <Field name="LegacyMtgeCharacteristic3" datatype="%String" sqlColumn="16">
  </Field>
  <Field name="LegacyMtgeCharacteristic4" datatype="%String" sqlColumn="17">
  </Field>
  <Field name="LegacyMtgeCharacteristic5" datatype="%String" sqlColumn="18">
  </Field>
  <Field name="LegacyIntRateType" datatype="%String" sqlColumn="19">
  </Field>
  <Field name="LegacyPropertyValue" datatype="%String" sqlColumn="20">
  </Field>
  <Field name="LegacyPrimaryBorrowerCrdHist1" datatype="%String" sqlColumn="21">
  </Field>
  <Field name="LegacyPrimaryBorrowerCrdHist2" datatype="%String" sqlColumn="22">
  </Field>
  <Field name="LegacyPrimaryBorrowerCrdHist3" datatype="%String" sqlColumn="23">
  </Field>
  <Field name="LegacyPrimaryBorrowerCrdHist4" datatype="%String" sqlColumn="24">
  </Field>
  <Field name="LegacySecondaryBorrowerCrdHist1" datatype="%String" sqlColumn="25">
  </Field>
  <Field name="LegacySecondaryBorrowerCrdHist2" datatype="%String" sqlColumn="26">
  </Field>
  <Field name="LegacySecondaryBorrowerCrdHist3" datatype="%String" sqlColumn="27">
  </Field>
  <Field name="LegacySecondaryBorrowerCrdHist4" datatype="%String" sqlColumn="28">
  </Field>
  <Field name="LegacyIncentiveRateEndDate" datatype="%String" sqlColumn="29">
  </Field>
  <Field name="LegacyNewDwelling" datatype="%String" sqlColumn="30">
  </Field>
  <Field name="LegacyAdvisedSale" datatype="%String" sqlColumn="31">
  </Field>
  <Field name="LegacyPropertyPostCode" datatype="%String" sqlColumn="32">
  </Field>
  <Field name="LegacyMtgeTerm" datatype="%String" sqlColumn="33">
  </Field>
  <Field name="LegacyPurchasePrice" datatype="%String" sqlColumn="34">
  </Field>
  <Field name="LegacyIncomeBasis" datatype="%String" sqlColumn="35">
  </Field>
  <Field name="LegacyERCEndDate" datatype="%String" sqlColumn="36">
  </Field>
  <Field name="LegacyHowSaleMade" datatype="%String" sqlColumn="37">
  </Field>
  <Field name="LegacyReversionRateType" datatype="%String" sqlColumn="38">
  </Field>
  <Field name="LegacyGovtInitiative" datatype="%String" sqlColumn="39">
  </Field>
  <Field name="LegacyRepayMethod" datatype="%String" sqlColumn="40">
  </Field>
  <Field name="LegacyRepayStrat1" datatype="%String" sqlColumn="41">
  </Field>
  <Field name="LegacyRepayStrat2" datatype="%String" sqlColumn="42">
  </Field>
  <Field name="LegacyRepayStrat3" datatype="%String" sqlColumn="43">
  </Field>
  <Field name="LegacyRepayStrat4" datatype="%String" sqlColumn="44">
  </Field>
  <Field name="LegacyRepayStrat5" datatype="%String" sqlColumn="45">
  </Field>
  <Field name="LegacyRepayStrat6" datatype="%String" sqlColumn="46">
  </Field>
  <Field name="LegacyRepayStrat7" datatype="%String" sqlColumn="47">
  </Field>
  <Field name="LegacyRepayStrat8" datatype="%String" sqlColumn="48">
  </Field>
  <Field name="LegacyRepayStrat9" datatype="%String" sqlColumn="49">
  </Field>
  <Field name="LegacyRepayStrat10" datatype="%String" sqlColumn="50">
  </Field>
  <Field name="LegacyRepayStrat11" datatype="%String" sqlColumn="51">
  </Field>
  <Field name="LegacyPercentageIO" datatype="%String" sqlColumn="52">
  </Field>
  <Field name="LegacyInterestRollUp" datatype="%String" sqlColumn="53">
  </Field>
  <Field name="LegacyValuationType" datatype="%String" sqlColumn="54">
  </Field>
  <Field name="LegacyMoneyWithdrawn" datatype="%String" sqlColumn="55">
  </Field>
  <Field name="LegacyDebtConsolidationAmt" datatype="%String" sqlColumn="56">
  </Field>
  <Field name="LegacyEarlyRepaymentCharge" datatype="%String" sqlColumn="57">
  </Field>
  <Field name="LegacyCurrency" datatype="%String" sqlColumn="58">
  </Field>
  <Field name="LegacyCustomerPct" datatype="%String" sqlColumn="59">
  </Field>
  <Field name="LegacyTotalLoanAvailable" datatype="%String" sqlColumn="60">
  </Field>
  <Field name="LegacyLenderFee" datatype="%String" sqlColumn="61">
  </Field>
  <Field name="LegacyIntermediaryFee" datatype="%String" sqlColumn="62">
  </Field>
  <Field name="LegacyProcurationFee" datatype="%String" sqlColumn="63">
  </Field>
  <Field name="LegacyTotalFeesCharges" datatype="%String" sqlColumn="64">
  </Field>
  <Field name="LegacyMtgeType1" datatype="%String" sqlColumn="65">
  </Field>
  <Field name="LegacyMtgeType2" datatype="%String" sqlColumn="66">
  </Field>
  <Field name="LegacyMtgeType3" datatype="%String" sqlColumn="67">
  </Field>
  <Field name="LegacyMtgeType4" datatype="%String" sqlColumn="68">
  </Field>
  <Field name="LegacyMtgeType5" datatype="%String" sqlColumn="69">
  </Field>
  <Field name="LegacyMtgeType6" datatype="%String" sqlColumn="70">
  </Field>
  <Field name="LegacyMtgeType7" datatype="%String" sqlColumn="71">
  </Field>
  <Field name="LegacyMtgeType8" datatype="%String" sqlColumn="72">
  </Field>
  <Field name="LegacyMtgeType9" datatype="%String" sqlColumn="73">
  </Field>
  <Field name="LegacyMtgeType10" datatype="%String" sqlColumn="74">
  </Field>
  <Field name="LegacyMtgeType11" datatype="%String" sqlColumn="75">
  </Field>
  <Field name="LegacyRemtgePurpose1" datatype="%String" sqlColumn="76">
  </Field>
  <Field name="LegacyRemtgePurpose2" datatype="%String" sqlColumn="77">
  </Field>
  <Field name="LegacyRemtgePurpose3" datatype="%String" sqlColumn="78">
  </Field>
</Record>
}

}
