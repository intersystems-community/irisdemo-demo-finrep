Class Normalization.NormalizedDataProjection Extends %Projection.AbstractProjection
{

Parameter CODETABLE = 0;

Parameter UTILITYFUNCTIONPREFIX;

/// This method is invoked when a class is compiled
ClassMethod CreateProjection(cls As %String, ByRef params) As %Status
{
    Set tSC = $$$OK
    Try 
    {
        // We don't do nothing when the basic OPCUA.DataSourceDef class definition is compiled
        Quit:cls="Normalization.NormalizedData"
        Quit:cls="Canonical.CT.CodeDescBase"
        
        Set tUtilityFunctionPrefix=$Get(params("UTILITYFUNCTIONPREFIX"))
        Set bIsCodeTable=+$Get(params("CODETABLE"),0)

        Set oRS = ##class(%ResultSet).%New()
        Set tSC = oRS.Prepare("select Name, Properties from %Dictionary.CompiledIndex where parent=? and PrimaryKey=1")
        Quit:$$$ISERR(tSC)

        Set tSC = oRS.Execute(cls)
        Quit:$$$ISERR(tSC)

        If oRS.Next()
        {
            Set tIndexName = oRS.GetData(1)
            Set tIndexParams = oRS.GetData(2)

            Set tMethodParameters = ..ParseIndexParams(cls, tIndexParams)

            Set tSC = ..UpdateCanonicalUtilityFunctions(cls, tUtilityFunctionPrefix, tIndexName_"Open", tMethodParameters, bIsCodeTable)
            Quit:$$$ISERR(tSC)
        }
    }
    Catch (oException)
    {
        Set tSC = oException.AsStatus()
    }
    
    Quit tSC
}

ClassMethod ParseIndexParams(pClassName As %String, pProperties As %String) As %List
{
    Set oClassDef = ##class(%Library.CompiledClass).%OpenId(pClassName)
    Set propertyList = ""
    For i=1:1:$Length(pProperties,",")
    {
        Set tPropName = $Piece(pProperties,",",i)
        For p=1:1:oClassDef.Properties.Count()
        {
            Set oProp=oClassDef.Properties.GetAt(p)

            If oProp.Name=tPropName
            {
                If $Extract(oProp.Type,1)="%" 
                {
                    Set isObjectRef=0
                }
                Else 
                {
                    Set isObjectRef=1
                }
                
                Set $List(propertyList,i)=$ListBuild(tPropName, isObjectRef)

                Break
            }
        }
    }

    Quit propertyList
}

ClassMethod UpdateCanonicalUtilityFunctions(pCanonicalClassName As %String, pUtilityFunctionPrefix As %String, pOpenMethodName As %String, pMethodParameters As %String, pIsCodeTable As %Boolean) As %Status
{
    Set tSC = $$$OK
    Try 
    {
        Set tUtilityFunctionClassName = $Piece(pCanonicalClassName, ".", 1, *-1)_".UtilityFunctions"
        Set tUtilityMethodName = pUtilityFunctionPrefix_$Piece(pCanonicalClassName, ".", *)

        Write !,"Adding or updating ##class("_tUtilityFunctionClassName_")."_tUtilityMethodName_"()..."

        Set oClassDef = ##class(%Dictionary.ClassDefinition).%OpenId(tUtilityFunctionClassName)
        If oClassDef=""
        {
            Set oClassDef = ##class(%Dictionary.ClassDefinition).%New()
            Set oClassDef.Name = tUtilityFunctionClassName
            Set oClassDef.Super="Ens.Rule.FunctionSet"
        }

        Set bMethodFound=0
        For i=1:1:oClassDef.Methods.Count()
        {
            Set oMethodDef = oClassDef.Methods.GetAt(i)
            If oMethodDef.Name=tUtilityMethodName Set bMethodFound=1 Quit
        }

        If 'bMethodFound
        {
            Set oMethodDef = ##class(%Dictionary.MethodDefinition).%New()
            Set oMethodDef.parent = oClassDef
        }

        Set oMethodDef.Name=tUtilityMethodName
        Set oMethodDef.ClassMethod=1
        //Set oMethodDef.CodeMode="expression"
        Set oMethodDef.ReturnType=pCanonicalClassName
        
        Set tFormalSpec=""
        For i=1:1:$Listlength(pMethodParameters)
        {
            Set tProperty=$ListGet(pMethodParameters,i)
            Set tPropertyName=$ListGet(tProperty,1)

            Set $Piece(tFormalSpec,",",i)=tPropertyName_"="""""
            Set $Piece(tIndexOpenParameters,",",i)=tPropertyName
            
        }

        Set tFormalSpec=tFormalSpec
        Set oMethodDef.FormalSpec=tFormalSpec

        Do oMethodDef.Implementation.Clear()
        Set tFirstParam=$ListGet($ListGet(pMethodParameters))
        //Do oMethodDef.Implementation.Write("$Select("_tFirstParam_"="""":##class("_pCanonicalClassName_").%New(), 1:##class("_pCanonicalClassName_")."_pOpenMethodName_"("_pMethodParameters_",,.pSC))")

        If 'pIsCodeTable
        {
            Do oMethodDef.Implementation.WriteLine(" Set new=0")
            Do oMethodDef.Implementation.WriteLine(" If "_tFirstParam_"="""" {")
            Do oMethodDef.Implementation.WriteLine("   Set obj = ##class("_pCanonicalClassName_").%New()")
            Do oMethodDef.Implementation.WriteLine("   Set new=1")
            Do oMethodDef.Implementation.WriteLine(" } Else {")
            
            Do oMethodDef.Implementation.Write("   Set obj=##class("_pCanonicalClassName_")."_pOpenMethodName_"(")
            
            For i=1:1:$Listlength(pMethodParameters)
            {
                Set tProperty=$ListGet(pMethodParameters,i)
                Set tPropertyName=$ListGet(tProperty,1)
                Set isObjectRef=$ListGet(tProperty,2)

                If 'isObjectRef
                {
                    Do oMethodDef.Implementation.Write(tPropertyName)    
                }
                Else 
                {
                    Do oMethodDef.Implementation.Write(tPropertyName_".%Id()") 
                }

                If i<$Listlength(pMethodParameters) Do oMethodDef.Implementation.Write(", ")
                
            }
            Do oMethodDef.Implementation.WriteLine(")")

            Do oMethodDef.Implementation.WriteLine("   If obj="""" { ")
            Do oMethodDef.Implementation.WriteLine("     Set obj = ##class("_pCanonicalClassName_").%New()")
            Do oMethodDef.Implementation.WriteLine("     Set new=1")
            Do oMethodDef.Implementation.WriteLine("   }")
            Do oMethodDef.Implementation.WriteLine(" }")
            Do oMethodDef.Implementation.WriteLine(" If new {")
            For i=1:1:$Listlength(pMethodParameters)
            {
                Set tProperty=$ListGet(pMethodParameters,i)
                Set tPropertyName=$ListGet(tProperty,1)
                Set isObjectRef=$ListGet(tProperty,2)

                Do oMethodDef.Implementation.WriteLine("   Set obj."_tPropertyName_"="_tPropertyName)                
            }
            #; Do oMethodDef.Implementation.WriteLine("   Set tSC=obj.%Save(0)")   
            #; Do oMethodDef.Implementation.WriteLine("   If $$$ISERR(tSC) { ")
            #; Do oMethodDef.Implementation.WriteLine("      Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,""Could not save object on "_pCanonicalClassName_".""))")
            #; Do oMethodDef.Implementation.WriteLine("      Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)")
            #; Do oMethodDef.Implementation.WriteLine("   }")
             
            Do oMethodDef.Implementation.WriteLine(" }")
            Do oMethodDef.Implementation.WriteLine(" Return obj")
            
        }
        Else
        {
            Do oMethodDef.Implementation.WriteLine(" If "_tFirstParam_"="""" Return """"")

            //Do oMethodDef.Implementation.WriteLine(" If $Data(^CTCache("""_pCanonicalClassName_""","_tIndexOpenParameters_"),obj) Quit obj")

            Do oMethodDef.Implementation.WriteLine(" Set obj=##class("_pCanonicalClassName_")."_pOpenMethodName_"("_tIndexOpenParameters_",,.tSC)")
            Do oMethodDef.Implementation.WriteLine(" If $$$ISERR(tSC) { ")
            Do oMethodDef.Implementation.WriteLine("    Set tSC = $System.Status.AppendStatus(tSC, $$$ERROR(5001,""Could not find entry on table "_pCanonicalClassName_".""))")
            Do oMethodDef.Implementation.WriteLine("    Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)")
            Do oMethodDef.Implementation.WriteLine(" }")
            
            //Do oMethodDef.Implementation.WriteLine(" Set ^CTCache("""_pCanonicalClassName_""","_tIndexOpenParameters_")=obj")

            Do oMethodDef.Implementation.WriteLine(" Return obj")
        }
        Set tSC = oClassDef.%Save(1)
        Quit:$$$ISERR(tSC)
        
        Set tSC = $System.OBJ.Compile(tUtilityFunctionClassName,"cuk")

        
    }
    Catch (oException)
    {
        Set tSC = oException.AsStatus()
    }
    
    Quit tSC
}

/// This method is invoked when a class is 'uncompiled'
ClassMethod RemoveProjection(cls As %String, ByRef params, recompile As %Boolean) As %Status
{
    Set tSC = $$$OK
    Try 
    {
        Quit:cls="Normalization.NormalizedData"
        Quit:cls="Canonical.CT.CodeDescBase"

        Set tUtilityFunctionPrefix=$Get(params("UTILITYFUNCTIONPREFIX"))

        Set tUtilityFunctionClassName = $Piece(cls, ".", 1, *-1)_".UtilityFunctions"
        Set tUtilityMethodName = tUtilityFunctionPrefix_$Piece(cls, ".", *)

        Set oClassDef = ##class(%Dictionary.ClassDefinition).%OpenId(tUtilityFunctionClassName)

        If oClassDef=""
        {
            Write !,"Class ",tUtilityFunctionClassName," not found!"
            Quit
        }

        Set bMethodFound=0
        For i=1:1:oClassDef.Methods.Count()
        {
            Set oMethodDef = oClassDef.Methods.GetAt(i)
            If oMethodDef.Name=tUtilityMethodName 
            {
                Set bMethodFound=1
                Quit
            }
        }

        If bMethodFound
        {
            Write !,"Removing ##class("_tUtilityFunctionClassName_")."_tUtilityMethodName_"()..."
            Do oClassDef.Methods.RemoveAt(i)
            Set tSC = oClassDef.%Save()
            Quit:$$$ISERR(tSC)

            Set tSC = $System.OBJ.Compile(tUtilityFunctionClassName,"cuk")
        }

    } 
    Catch (oException)
    {
        Set tSC = oException.AsStatus()
    }
    
    QUIT tSC
}

}
