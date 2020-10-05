/* Copyright (c) 2020 by InterSystems Corporation.
   Cambridge, Massachusetts, U.S.A.  All rights reserved.
   Confidential property of InterSystems Corporation. */

Class Hyperledger.Adapter.Common Extends EnsLib.PEX.OutboundAdapter
{

Property %gatewayExtraClasspaths As %String [ InitialExpression = "/hyperledger/hyperledger-pex-adapter.jar" ];

/// The Channel on the Hyperledger network to connect too.
Property Channel As %String;

/// The Name of the Hyperledger Smart Contract to use for sending information.
Property Contract As %String;

Parameter SETTINGS = "-%remoteClassname,-%remoteSettings,-%gatewayExtraClasspaths,Channel:Basic,Contract:Basic";

Method OnInit() As %Status
{
    $$$LOGINFO("Common.OnInit()")

    Do ..AddRemoteSetting("Channel", ..Channel)
    Do ..AddRemoteSetting("Contract", ..Contract)

	Quit ##super()
}

Method AddRemoteSetting(pKey As %String, pValue As %String)
{
    If ..%remoteSettings=""
    {
        Set ..%remoteSettings=pKey_"="_pValue
    }
    Else
    {
        Set ..%remoteSettings=..%remoteSettings_$C(13,10)_pKey_"="_pValue
    }
}

}
