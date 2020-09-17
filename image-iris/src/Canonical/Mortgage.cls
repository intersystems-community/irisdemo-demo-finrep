Class Canonical.Mortgage Extends Normalization.NormalizedData
{

Property Affordability As Canonical.MortgageAfford [ Calculated, SqlComputeCode = { 
    Set idMortgageAfford=""
    Set idMortgage={ID}

    &sql(select top 1 ID into :idMortgageAfford 
            from Canonical.MortgageAfford 
            where Mortgage=:idMortgage 
            and AsOfDate >= (select max(AsOfDate) from Canonical.MortgageAfford 
                             where Mortgage=:idMortgage))
    Set {*} = idMortgageAfford
}, SqlComputed ];

Property AsOfDate As %Date [ SqlColumnNumber = 2 ];

Property FirmId As %String [ SqlColumnNumber = 3 ];

Property TransactionId As %String [ SqlColumnNumber = 4 ];

Property AcctOpenDate As %Date [ SqlColumnNumber = 5 ];

Property BorrowerType As Canonical.CT.BorrowerType [ SqlColumnNumber = 6 ];

Property LoanAmt As %Double [ SqlColumnNumber = 7 ];

Property PrimaryDateOfBirth As %Date [ SqlColumnNumber = 8 ];

Property SecondaryDateOfBirth As %String [ SqlColumnNumber = 9 ];

Property PrimaryBorrowerCCJValue As %Double [ SqlColumnNumber = 10 ];

Property SecondaryBorrowerCCJValue As %Double [ SqlColumnNumber = 11 ];

Property InitialGrossIntRate As %Double [ SqlColumnNumber = 12 ];

Property PrincipalOrNetworkFirmId As %String [ SqlColumnNumber = 13 ];

Property MtgeCharacteristic1 As Canonical.CT.MtgeChar [ SqlColumnNumber = 14 ];

Property MtgeCharacteristic2 As Canonical.CT.MtgeChar [ SqlColumnNumber = 15 ];

Property MtgeCharacteristic3 As Canonical.CT.MtgeChar [ SqlColumnNumber = 16 ];

Property MtgeCharacteristic4 As Canonical.CT.MtgeChar [ SqlColumnNumber = 17 ];

Property MtgeCharacteristic5 As Canonical.CT.MtgeChar [ SqlColumnNumber = 18 ];

Property IntRateType As Canonical.CT.TypeIntRate [ SqlColumnNumber = 19 ];

Property PropertyValue As %Double [ SqlColumnNumber = 20 ];

Property PrimaryBorrowerCrdHist1 As Canonical.CT.BorrowerImpCredHist [ SqlColumnNumber = 21 ];

Property PrimaryBorrowerCrdHist2 As Canonical.CT.BorrowerImpCredHist [ SqlColumnNumber = 22 ];

Property PrimaryBorrowerCrdHist3 As Canonical.CT.BorrowerImpCredHist [ SqlColumnNumber = 23 ];

Property PrimaryBorrowerCrdHist4 As Canonical.CT.BorrowerImpCredHist [ SqlColumnNumber = 24 ];

Property SecondaryBorrowerCrdHist1 As Canonical.CT.BorrowerImpCredHist [ SqlColumnNumber = 25 ];

Property SecondaryBorrowerCrdHist2 As Canonical.CT.BorrowerImpCredHist [ SqlColumnNumber = 26 ];

Property SecondaryBorrowerCrdHist3 As Canonical.CT.BorrowerImpCredHist [ SqlColumnNumber = 27 ];

Property SecondaryBorrowerCrdHist4 As Canonical.CT.BorrowerImpCredHist [ SqlColumnNumber = 28 ];

Property IncentiveRateEndDate As %Date [ SqlColumnNumber = 29 ];

Property NewDwelling As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 30 ];

Property AdvisedSale As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 31 ];

Property PropertyPostCode As %String [ SqlColumnNumber = 32 ];

Property MtgeTerm As %Integer [ SqlColumnNumber = 33 ];

Property PurchasePrice As %Double [ SqlColumnNumber = 34 ];

Property IncomeBasisType As Canonical.CT.IncomeBasis [ SqlColumnNumber = 35 ];

Property ERCEndDate As %Date [ SqlColumnNumber = 36 ];

Property HowSaleMade As Canonical.CT.HowSaleMade [ SqlColumnNumber = 37 ];

Property ReversionRateType As Canonical.CT.TypeReversionRate [ SqlColumnNumber = 38 ];

Property GovtInitiative As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 39 ];

Property RepayMethod As Canonical.CT.RepayMethod [ SqlColumnNumber = 40 ];

Property RepayStrat1 As Canonical.CT.RepaymentStrategy [ SqlColumnNumber = 41 ];

Property RepayStrat2 As Canonical.CT.RepaymentStrategy [ SqlColumnNumber = 42 ];

Property RepayStrat3 As Canonical.CT.RepaymentStrategy [ SqlColumnNumber = 43 ];

Property RepayStrat4 As Canonical.CT.RepaymentStrategy [ SqlColumnNumber = 44 ];

Property RepayStrat5 As Canonical.CT.RepaymentStrategy [ SqlColumnNumber = 45 ];

Property RepayStrat6 As Canonical.CT.RepaymentStrategy [ SqlColumnNumber = 46 ];

Property RepayStrat7 As Canonical.CT.RepaymentStrategy [ SqlColumnNumber = 47 ];

Property RepayStrat8 As Canonical.CT.RepaymentStrategy [ SqlColumnNumber = 48 ];

Property RepayStrat9 As Canonical.CT.RepaymentStrategy [ SqlColumnNumber = 49 ];

Property RepayStrat10 As Canonical.CT.RepaymentStrategy [ SqlColumnNumber = 50 ];

Property RepayStrat11 As Canonical.CT.RepaymentStrategy [ SqlColumnNumber = 51 ];

Property PercentageIO As %Double [ SqlColumnNumber = 52 ];

Property InterestRollUp As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 53 ];

Property ValuationType As Canonical.CT.ValuationType [ SqlColumnNumber = 54 ];

Property MoneyWithdrawn As %Double [ SqlColumnNumber = 55 ];

Property DebtConsolidationAmt As %Double [ SqlColumnNumber = 56 ];

Property EarlyRepaymentCharge As %String(DISPLAYLIST = ",Yes,No", VALUELIST = ",Y,N") [ SqlColumnNumber = 57 ];

Property Currency As %String [ SqlColumnNumber = 58 ];

Property CustomerPct As %Double [ SqlColumnNumber = 59 ];

Property TotalLoanAvailable As %Double [ SqlColumnNumber = 60 ];

Property LenderFee As %Double [ SqlColumnNumber = 61 ];

Property IntermediaryFee As %Double [ SqlColumnNumber = 62 ];

Property ProcurationFee As %Double [ SqlColumnNumber = 63 ];

Property TotalFeesCharges As %Double [ SqlColumnNumber = 64 ];

Property MtgeType1 As Canonical.CT.MtgeType [ SqlColumnNumber = 65 ];

Property MtgeType2 As Canonical.CT.MtgeType [ SqlColumnNumber = 66 ];

Property MtgeType3 As Canonical.CT.MtgeType [ SqlColumnNumber = 67 ];

Property MtgeType4 As Canonical.CT.MtgeType [ SqlColumnNumber = 68 ];

Property MtgeType5 As Canonical.CT.MtgeType [ SqlColumnNumber = 69 ];

Property MtgeType6 As Canonical.CT.MtgeType [ SqlColumnNumber = 70 ];

Property MtgeType7 As Canonical.CT.MtgeType [ SqlColumnNumber = 71 ];

Property MtgeType8 As Canonical.CT.MtgeType [ SqlColumnNumber = 72 ];

Property MtgeType9 As Canonical.CT.MtgeType [ SqlColumnNumber = 73 ];

Property MtgeType10 As Canonical.CT.MtgeType [ SqlColumnNumber = 74 ];

Property MtgeType11 As Canonical.CT.MtgeType [ SqlColumnNumber = 75 ];

Property RemtgePurpose1 As Canonical.CT.RemtgePurpose [ SqlColumnNumber = 76 ];

Property RemtgePurpose2 As Canonical.CT.RemtgePurpose [ SqlColumnNumber = 77 ];

Property RemtgePurpose3 As Canonical.CT.RemtgePurpose [ SqlColumnNumber = 78 ];

Index FirmAndTransIndex On (FirmId, TransactionId) [ PrimaryKey ];

Storage Default
{
<Data name="MortgageDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>%BatchControlRecord</Value>
</Value>
<Value name="3">
<Value>%OriginalBatchRecordId</Value>
</Value>
<Value name="4">
<Value>%BatchRecordStatus</Value>
</Value>
<Value name="5">
<Value>TransactionId</Value>
</Value>
<Value name="6">
<Value>AcctOpenDate</Value>
</Value>
<Value name="7">
<Value>BorrowerType</Value>
</Value>
<Value name="8">
<Value>LoanAmt</Value>
</Value>
<Value name="9">
<Value>PrimaryDateOfBirth</Value>
</Value>
<Value name="10">
<Value>SecondaryDateOfBirth</Value>
</Value>
<Value name="11">
<Value>PrimaryBorrowerCCJValue</Value>
</Value>
<Value name="12">
<Value>SecondaryBorrowerCCJValue</Value>
</Value>
<Value name="13">
<Value>InitialGrossIntRate</Value>
</Value>
<Value name="14">
<Value>PrincipalOrNetworkFirmId</Value>
</Value>
<Value name="15">
<Value>MtgeCharacteristic1</Value>
</Value>
<Value name="16">
<Value>MtgeCharacteristic2</Value>
</Value>
<Value name="17">
<Value>MtgeCharacteristic3</Value>
</Value>
<Value name="18">
<Value>MtgeCharacteristic4</Value>
</Value>
<Value name="19">
<Value>MtgeCharacteristic5</Value>
</Value>
<Value name="20">
<Value>IntRateType</Value>
</Value>
<Value name="21">
<Value>PropertyValue</Value>
</Value>
<Value name="22">
<Value>PrimaryBorrowerCrdHist1</Value>
</Value>
<Value name="23">
<Value>PrimaryBorrowerCrdHist2</Value>
</Value>
<Value name="24">
<Value>PrimaryBorrowerCrdHist3</Value>
</Value>
<Value name="25">
<Value>PrimaryBorrowerCrdHist4</Value>
</Value>
<Value name="26">
<Value>SecondaryBorrowerCrdHist1</Value>
</Value>
<Value name="27">
<Value>SecondaryBorrowerCrdHist2</Value>
</Value>
<Value name="28">
<Value>SecondaryBorrowerCrdHist3</Value>
</Value>
<Value name="29">
<Value>SecondaryBorrowerCrdHist4</Value>
</Value>
<Value name="30">
<Value>IncentiveRateEndDate</Value>
</Value>
<Value name="31">
<Value>NewDwelling</Value>
</Value>
<Value name="32">
<Value>AdvisedSale</Value>
</Value>
<Value name="33">
<Value>PropertyPostCode</Value>
</Value>
<Value name="34">
<Value>MtgeTerm</Value>
</Value>
<Value name="35">
<Value>PurchasePrice</Value>
</Value>
<Value name="36">
<Value>IncomeBasisType</Value>
</Value>
<Value name="37">
<Value>ERCEndDate</Value>
</Value>
<Value name="38">
<Value>HowSaleMade</Value>
</Value>
<Value name="39">
<Value>ReversionRateType</Value>
</Value>
<Value name="40">
<Value>GovtInitiative</Value>
</Value>
<Value name="41">
<Value>RepayMethod</Value>
</Value>
<Value name="42">
<Value>RepayStrat1</Value>
</Value>
<Value name="43">
<Value>RepayStrat2</Value>
</Value>
<Value name="44">
<Value>RepayStrat3</Value>
</Value>
<Value name="45">
<Value>RepayStrat4</Value>
</Value>
<Value name="46">
<Value>RepayStrat5</Value>
</Value>
<Value name="47">
<Value>RepayStrat6</Value>
</Value>
<Value name="48">
<Value>RepayStrat7</Value>
</Value>
<Value name="49">
<Value>RepayStrat8</Value>
</Value>
<Value name="50">
<Value>RepayStrat9</Value>
</Value>
<Value name="51">
<Value>RepayStrat10</Value>
</Value>
<Value name="52">
<Value>RepayStrat11</Value>
</Value>
<Value name="53">
<Value>PercentageIO</Value>
</Value>
<Value name="54">
<Value>InterestRollUp</Value>
</Value>
<Value name="55">
<Value>ValuationType</Value>
</Value>
<Value name="56">
<Value>MoneyWithdrawn</Value>
</Value>
<Value name="57">
<Value>DebtConsolidationAmt</Value>
</Value>
<Value name="58">
<Value>EarlyRepaymentCharge</Value>
</Value>
<Value name="59">
<Value>Currency</Value>
</Value>
<Value name="60">
<Value>CustomerPct</Value>
</Value>
<Value name="61">
<Value>TotalLoanAvailable</Value>
</Value>
<Value name="62">
<Value>LenderFee</Value>
</Value>
<Value name="63">
<Value>IntermediaryFee</Value>
</Value>
<Value name="64">
<Value>ProcurationFee</Value>
</Value>
<Value name="65">
<Value>TotalFeesCharges</Value>
</Value>
<Value name="66">
<Value>MtgeType1</Value>
</Value>
<Value name="67">
<Value>MtgeType2</Value>
</Value>
<Value name="68">
<Value>MtgeType3</Value>
</Value>
<Value name="69">
<Value>MtgeType4</Value>
</Value>
<Value name="70">
<Value>MtgeType5</Value>
</Value>
<Value name="71">
<Value>MtgeType6</Value>
</Value>
<Value name="72">
<Value>MtgeType7</Value>
</Value>
<Value name="73">
<Value>MtgeType8</Value>
</Value>
<Value name="74">
<Value>MtgeType9</Value>
</Value>
<Value name="75">
<Value>MtgeType10</Value>
</Value>
<Value name="76">
<Value>MtgeType11</Value>
</Value>
<Value name="77">
<Value>RemtgePurpose1</Value>
</Value>
<Value name="78">
<Value>RemtgePurpose2</Value>
</Value>
<Value name="79">
<Value>RemtgePurpose3</Value>
</Value>
<Value name="80">
<Value>AsOfDate</Value>
</Value>
<Value name="81">
<Value>FirmId</Value>
</Value>
</Data>
<DataLocation>^Canonical.MortgageD</DataLocation>
<DefaultData>MortgageDefaultData</DefaultData>
<IdLocation>^Canonical.MortgageD</IdLocation>
<IndexLocation>^Canonical.MortgageI</IndexLocation>
<StreamLocation>^Canonical.MortgageS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
