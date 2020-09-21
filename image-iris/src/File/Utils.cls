Include Macros

Class File.Utils
{

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

}
