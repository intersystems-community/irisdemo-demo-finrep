/// Copied some code from EnsLib.EDI.XML.Operation.FileOperation
Class Custom.FCAReport.BO.XMLFileReport.Operation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Property Adapter As EnsLib.File.OutboundAdapter;

/* Keep in sync with comments in method EnsLib.EDI.XML.DOM:domGetSubtree() - except for the C() part which is described in EnsLib.EDI.XML.Document:OutputToIOStream() */
/// String of format specification characters to use in encoding outbound documents.
/// Empty string means use the default behavior. <p/>
/// Format specification characters:<ul>
/// <li>1-9 : indent with this number of spaces (4 is the default with the 'i' format specifier)</li>
/// <li>a : attributes alphabetical</li>
/// <li>c : canonical ; ignores 'eintw'</li>
/// <li>e : close elements even when empty</li>
/// <li>f : full top element not just its contents</li>
/// <li>i : indent with 4 spaces unless 't' or 1-9</li>
/// <li>l : output schema information, schema uri and schema location, based on property stored in ..schemaLocation</li>
/// <li>n : newline (lf) after every text-free element</li>
/// <li>o : output unescaped - for instance don't change &lt; to &amp;lt;</li>
/// <li>p : suppress output of namespace prefixes</li>
/// <li>q : use double quotes to set off attribute values if possible</li>
/// <li>s : use stored indentation whitespace (ignores 'it1-9')</li>
/// <li>r : use stored returns / newlines (ignores 'nw')</li>
/// <li>t : indent with tab</li>
/// <li>u : declare prefixes as well as using them</li>
/// <li>w : Windows-style cr/lf newline after every text-free element</li>
/// <li>x : omit namespaces in output</li>
/// <li>C(e) : output an XML header line declaring character encoding e. If e is empty use the encoding defined by the Adapter. If e begins with ! force the output stream's encoding. Note that this will be applied automatically for File Operations configured with a non-UTF-8 Charset</li>
/// </ul>
Property Format As %String;

/// Name of file to output the document(s) to. May include timestamp specifiers. The %f specifier if present will be 
/// replaced with the name of the document's original source stream. (stripped of characters illegal in filenames).<p>
/// See the method Ens.Util.File.CreateTimestamp() for documentation of timestamping options.
Property Filename As %String(MAXLEN = 1000, MINLEN = 1) [ InitialExpression = "%f_%Q.xml", Required ];

Parameter SETTINGS As %String = "Filename";

Method SaveReport(pRequest As Report.ReportScheduleRun, Output pResponse As Ens.Response) As %Status
{
  Set tSC = $$$OK
  Try 
  {
      Set ..Adapter.Overwrite = 1

      Set tFilename=..Adapter.CreateTimestamp(##class(%File).GetFilename(pRequest.ReportSchedule.Report.ReportCode),..Filename)
      
      Set tForce=("!"=$E(..Adapter.Charset))
      Set tCharset=$S(tForce:$E(..Adapter.Charset,2,*),1:..Adapter.Charset)
      If "@"=$E(tCharset) 
      { 
        Set tTable=$E(tCharset,2,*) 
      }
      Else 
      {
        Set tTable = ##class(%IO.I.TranslationDevice).GetCharEncodingTable(tCharset) 
      }
      Set:(tTable'="UTF8"||tForce)&&(..Format'["C(") ..Format=..Format_"C("_..Adapter.Charset_")"
      Set:tForce tCharset=..Adapter.Charset, ..Adapter.Charset="" ; temporarily suppress charset because XML.Document will force it

      Set stream = ##class(%Library.FileCharacterStream).%New()
      Set reportObjTree = $classmethod(pRequest.ReportClassName, "%OpenId", pRequest.GeneratedReportObjectId,, .tSC)
      Quit:$$$ISERR(tSC)

      Set tSC = reportObjTree.XMLExportToStream(.stream,,"literal,indent("_$C(9)_")")
      Quit:$$$ISERR(tSC)

      Set tSC=..Adapter.PutStream(tFilename,stream)  
      Quit:$$$ISERR(tSC)

      Set:tForce ..Adapter.Charset=tCharset ; restore old value
  } 
  Catch (oException)
  {
      Set tSC = oException.AsStatus()  
  }

	Quit tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Report.ReportScheduleRun">
    <Method>SaveReport</Method>
  </MapItem>
</MapItems>
}

}
