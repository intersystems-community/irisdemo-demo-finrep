/// RECORDMAP: Modified during compilation of RecordMap 'Staging.RM.MortgagePerf'
/// on 2020-09-24 at 15:40:19.417 [2020-09-24 15:40:19.417 UTC]
/// by user SuperUser
Class Staging.RM.MortgagePerf Extends EnsLib.RecordMap.RecordMap
{

Parameter OBJECTNAME = "Staging.RM.MortgagePerf.Record";

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
	Set tStatus = ..chunkRecord(pStream, .tRecordData, .tCharCount, "", pTimeout, $char(13,10), tRecLabel, .pLookAhead, $char(34))
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
		Set pObject.LegacyTransRef = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyLoanPurchase = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyOrigProviderFRN = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyOutstandingBalance = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyValueLinkedAccounts = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyIncentivisedRate = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRemainingTerm = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyMonthsPastMaturity = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyReasonForClosure = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyCurrentPaymentShortfall = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyArrearsStartDate = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPaymentShortfallArrangement = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyDateFormalArrangement = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPaymentShortfallCapitalisation = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyCapitalisationDate = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacySwitchInterestOnly = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyInterestOnlyDate = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPaymentsSuspended = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyDatesPaymentsSuspended = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyReducedPayments = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyDateReducedPayments = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyTermExtension = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyDateTermExtension = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyOtherForbearance = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyDateOtherForbearance = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyDateLitigationStarted = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyPossessionOrder = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyDatePossession = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyRepossessionSaleValueAchieved = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyDateofBalance = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacySecondChargeMortgage = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyBeneficialOwnerRegFirm = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyBeneficialOwnerFRN = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyBeneficialOwnerName = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyLegalOwnerRegFirm = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyLegalOwnerFRN = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyLegalOwnerName = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.LegacyClosedBook = tCurrString
	}
	Quit tStatus
}

/// Internal helper method to output object to a stream
ClassMethod PutRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pHasTopFields As %Boolean, ByRef pPadArray As %String) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	Do pStream.Write($select(pHasTopFields: ..Escape(pObject.LegacyAsOfDate, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyFirmId, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyTransRef, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyLoanPurchase, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyOrigProviderFRN, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyOutstandingBalance, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyValueLinkedAccounts, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyIncentivisedRate, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyRemainingTerm, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyMonthsPastMaturity, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyReasonForClosure, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyCurrentPaymentShortfall, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyArrearsStartDate, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyPaymentShortfallArrangement, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyDateFormalArrangement, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyPaymentShortfallCapitalisation, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyCapitalisationDate, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacySwitchInterestOnly, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyInterestOnlyDate, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyPaymentsSuspended, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyDatesPaymentsSuspended, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyReducedPayments, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyDateReducedPayments, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyTermExtension, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyDateTermExtension, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyOtherForbearance, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyDateOtherForbearance, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyDateLitigationStarted, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyPossessionOrder, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyDatePossession, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyRepossessionSaleValueAchieved, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyDateofBalance, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacySecondChargeMortgage, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyBeneficialOwnerRegFirm, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyBeneficialOwnerFRN, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyBeneficialOwnerName, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyLegalOwnerRegFirm, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyLegalOwnerFRN, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyLegalOwnerName, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.LegacyClosedBook, $lb($char(44)),"quote",$char(34)),1: ""),0)
	Do pStream.Write($char(13,10), 0, .tStatus)
	If $$$ISERR(tStatus) Quit tStatus
	Quit tStatus
}

ClassMethod GetGeneratedClasses(Output pClasses As %String) As %Status
{
	Kill pClasses
	Set pClasses("Staging.RM.MortgagePerf.Batch")=""
	Set pClasses("Staging.RM.MortgagePerf.Record")=""
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
<Record xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="Staging.RM.MortgagePerf" type="delimited" char_encoding="UTF-8" targetClassname="Staging.RM.MortgagePerf.Record" batchClass="Staging.RM.MortgagePerf.Batch" complexBatchManaged="0" padFromLeft="0" recordTerminator="\x0d\x0a" escaping="quote" escapeSequence="&quot;" allowEarlyTerminator="0">
  <Separators>
    <Separator>,</Separator>
  </Separators>
  <Field name="LegacyAsOfDate" datatype="%String" sqlColumn="2">
  </Field>
  <Field name="LegacyFirmId" datatype="%String" sqlColumn="3">
  </Field>
  <Field name="LegacyTransRef" datatype="%String" sqlColumn="4">
  </Field>
  <Field name="LegacyLoanPurchase" datatype="%String" sqlColumn="5">
  </Field>
  <Field name="LegacyOrigProviderFRN" datatype="%String" sqlColumn="6">
  </Field>
  <Field name="LegacyOutstandingBalance" datatype="%String" sqlColumn="7">
  </Field>
  <Field name="LegacyValueLinkedAccounts" datatype="%String" sqlColumn="8">
  </Field>
  <Field name="LegacyIncentivisedRate" datatype="%String" sqlColumn="9">
  </Field>
  <Field name="LegacyRemainingTerm" datatype="%String" sqlColumn="10">
  </Field>
  <Field name="LegacyMonthsPastMaturity" datatype="%String" sqlColumn="11">
  </Field>
  <Field name="LegacyReasonForClosure" required="0" ignored="0" datatype="%String" params="MAXLEN=1024" sqlColumn="12" repeating="0">
  </Field>
  <Field name="LegacyCurrentPaymentShortfall" required="0" ignored="0" datatype="%String" params="MAXLEN=1024" sqlColumn="13" repeating="0">
  </Field>
  <Field name="LegacyArrearsStartDate" datatype="%String" sqlColumn="14">
  </Field>
  <Field name="LegacyPaymentShortfallArrangement" datatype="%String" sqlColumn="15">
  </Field>
  <Field name="LegacyDateFormalArrangement" datatype="%String" sqlColumn="16">
  </Field>
  <Field name="LegacyPaymentShortfallCapitalisation" datatype="%String" sqlColumn="17">
  </Field>
  <Field name="LegacyCapitalisationDate" datatype="%String" sqlColumn="18">
  </Field>
  <Field name="LegacySwitchInterestOnly" datatype="%String" sqlColumn="19">
  </Field>
  <Field name="LegacyInterestOnlyDate" datatype="%String" sqlColumn="20">
  </Field>
  <Field name="LegacyPaymentsSuspended" datatype="%String" sqlColumn="21">
  </Field>
  <Field name="LegacyDatesPaymentsSuspended" datatype="%String" sqlColumn="22">
  </Field>
  <Field name="LegacyReducedPayments" datatype="%String" sqlColumn="23">
  </Field>
  <Field name="LegacyDateReducedPayments" datatype="%String" sqlColumn="24">
  </Field>
  <Field name="LegacyTermExtension" datatype="%String" sqlColumn="25">
  </Field>
  <Field name="LegacyDateTermExtension" datatype="%String" sqlColumn="26">
  </Field>
  <Field name="LegacyOtherForbearance" datatype="%String" sqlColumn="27">
  </Field>
  <Field name="LegacyDateOtherForbearance" datatype="%String" sqlColumn="28">
  </Field>
  <Field name="LegacyDateLitigationStarted" datatype="%String" sqlColumn="29">
  </Field>
  <Field name="LegacyPossessionOrder" datatype="%String" sqlColumn="30">
  </Field>
  <Field name="LegacyDatePossession" datatype="%String" sqlColumn="31">
  </Field>
  <Field name="LegacyRepossessionSaleValueAchieved" datatype="%String" sqlColumn="32">
  </Field>
  <Field name="LegacyDateofBalance" datatype="%String" sqlColumn="33">
  </Field>
  <Field name="LegacySecondChargeMortgage" datatype="%String" sqlColumn="34">
  </Field>
  <Field name="LegacyBeneficialOwnerRegFirm" datatype="%String" sqlColumn="35">
  </Field>
  <Field name="LegacyBeneficialOwnerFRN" datatype="%String" sqlColumn="36">
  </Field>
  <Field name="LegacyBeneficialOwnerName" datatype="%String" sqlColumn="37">
  </Field>
  <Field name="LegacyLegalOwnerRegFirm" datatype="%String" sqlColumn="38">
  </Field>
  <Field name="LegacyLegalOwnerFRN" datatype="%String" sqlColumn="39">
  </Field>
  <Field name="LegacyLegalOwnerName" datatype="%String" sqlColumn="40">
  </Field>
  <Field name="LegacyClosedBook" datatype="%String" sqlColumn="41">
  </Field>
</Record>
}

}
