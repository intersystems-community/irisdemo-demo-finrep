Include Macros

Class IRISDemo.LandingPage.Utils
{

ClassMethod GetReportFileNameWithSubstring(pFileNameSubstring As %String) As %String
{
    Set tSC = $$$OK

	Try 
    {
        Set oRS = ##class(%ResultSet).%New("%Library.File:FileSet")
        Set tSC = oRS.Execute("/FCAGeneratedReports/", "*"_pFileNameSubstring_"*.xml")
        Quit:$$$ISERR(tSC)

        If oRS.Next()
        {
            Set tFileName = oRS.GetData(1)
            Set tFileName=$Piece(tFileName,"/",*)

            Set tSC = ..CompressFile("/FCAGeneratedReports", tFileName, .tZippedFileName)
            Quit:$$$ISERR(tSC)

            Return "1^"_tZippedFileName
        }

        Return "The report has not been generated yet. If you triggered it, it is probably still being processed."
    }
    Catch (oException)
    {
        set tSC = oException.AsStatus()
    }

    Quit $System.Status.GetErrorText(tSC)
}

ClassMethod CompressFile(pDir As %String, pFileName As %String, Output pZippedFileName As %String) As %Status
{
    Set pFileNameWithoutExtension = $Piece(pFileName,".",1,*-1)
    Set pZippedFileName = pFileNameWithoutExtension_".zip"

    Do ##class(%File).Delete(pDir_"/"_pZippedFileName)

    Set tRet = $ZF(-100, "", "tar", "-czf", pDir_"/"_pZippedFileName, pDir_"/"_pFileName)

    If tRet=-1
    {
        Quit $$$ERROR(5001, "Could compress file "_pFileName)
    }

    Quit $$$OK
}

ClassMethod MoveFile(pFileName As %String, pFileDirectory As %String) As %String
{
    Set tSC = $$$OK

	Try {
        SET Source = pFileDirectory _ "/Originals/" _ pFileName
        SET Destination = $Replace(Source, "Originals", "In")

        If ##class(%File).Exists(Source) {
            Set file = ##class(%File).%New(Source)
            Do file.CopyFile(Source, Destination)
        }
        Else {
            SET tSC = $System.Status.Error(400, "Input File Could not be found!")
        }
    }
    Catch (oException)
    {
        set tSC = oException.AsStatus()
    }
    If $$$ISERR(tSC){
        Quit $System.Status.GetErrorText(tSC)
    }
    Quit 1
}

ClassMethod MoveAllFiles(pFileDirectory As %String) As %String
{
    Set tSC = $$$OK

	Try {
        SET Dir = pFileDirectory_"/Originals/"
        SET Source = $ZSEARCH(Dir_"*")
        WHILE Source'="" {
            SET Destination = $Replace(Source, "Originals", "In")
            SET file = ##class(%File).%New(Source)
            Do file.CopyFile(Source, Destination)
            SET Source=$ZSEARCH("")
        }
    }
    Catch (oException)
    {
        set tSC = oException.AsStatus()
    }

    If $$$ISERR(tSC){
        Quit $System.Status.GetErrorText(tSC)
    }
    Quit 1
}

ClassMethod GenerateReportByScheduleId(pReportScheduleId As %String) As %String
{
    Set tSC = $$$OK

	Try 
    {
        Set tSC = ..VerifyDataAvailability()
        Quit:$$$ISERR(tSC)

        // Verify if this schedule exists
        Set oReportSchedule = ##class(Report.ReportSchedule).%OpenId(pReportScheduleId, ,.tSC)
        Quit:$$$ISERR(tSC)

        Set tSC = ##class(Ens.Director).CreateBusinessService("Report Service", .oService)
        Quit:$$$ISERR(tSC)

        Set oReportRequest = ##class(Report.BP.Request).%New()
        Set oReportRequest.ReportScheduleId = pReportScheduleId

        Set tSC = oService.ProcessInput(oReportRequest)

    }
    Catch (oException)
    {
        set tSC = oException.AsStatus()
    }

    If $$$ISERR(tSC)
    {
        Quit $System.Status.GetErrorText(tSC)
    }

    Quit 1
}

ClassMethod VerifyDataAvailability() As %Status
{

    Set tSC = $$$OK

	Try 
    {
        Set oRS = ##class(%ResultSet).%New()
        Set tSC = oRS.Prepare("select count(ID) from Canonical.Mortgage where %BatchRecordStatus=7")
        Quit:$$$ISERR(tSC)

        Set tSC = oRS.Execute()
        Quit:$$$ISERR(tSC)

        Do oRS.Next()

        If oRS.GetData(1)<69936
        {
            Set tSC = $$$ERROR(5001,"Mortgage sales data not available. If you have just sent the data, wait a little bit longer for it to be processed and try again.")
        }

        Set oRS = ##class(%ResultSet).%New()
        Set tSC = oRS.Prepare("select count(ID) from Canonical.MortgageAfford where %BatchRecordStatus=7")
        Quit:$$$ISERR(tSC)

        Set tSC = oRS.Execute()
        Quit:$$$ISERR(tSC)

        Do oRS.Next()

        If oRS.GetData(1)<69936
        {
            Set tSC = $$$ERROR(5001,"Mortgage Affordability sales data not available. If you have just sent the data, wait a little bit longer for it to be processed and try again.")
        }
    }
    Catch (oException)
    {
        set tSC = oException.AsStatus()
    }

    Quit tSC
}

}
