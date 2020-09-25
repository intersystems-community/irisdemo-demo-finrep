/// Created from: https://gabriel.fca.org.uk/specifications/MER/DRG/PSD001/v2/psd001-schema-v2-2.xsd
Class FCA.PSD001.Mortgage Extends (%Persistent, %XML.Adaptor) [ CompileAfter = (FCA.PSD001.NonNegativeMonetaryType, FCA.PSD001.PercentDP0Type, FCA.PSD001.PercentDP2Type, FCA.PSD001.RemortgagePurposeType, FCA.PSD001.YesNoType, FCA.PSD001.cmn.FSARefType, FCA.PSD001.cmn.PostCodeType, FCA.PSD001.cmn.YNType), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://www.fsa.gov.uk/XMLSchema/FSAHSFFeedMG-v2";

Parameter XMLNAME = "Mortgage";

Parameter XMLSEQUENCE = 1;

Property PrincipalOrNetworkFSARef As FCA.PSD001.cmn.FSARefType(XMLNAME = "PrincipalOrNetworkFSARef");

Property AcctOpenDate As %Date(XMLNAME = "AcctOpenDate") [ Required ];

Property AdvisedSale As FCA.PSD001.cmn.YNType(XMLNAME = "AdvisedSale");

Property TypeIntRate As %String(MAXLEN = "", VALUELIST = ",01,02,03,04,05,06,07,08,99", XMLNAME = "TypeIntRate") [ Required ];

/// List up to 12 additional mortgage characterisitics, if applicable. Where more than one code applies, report them all.
Property MtgeTypeList As list Of %String(MAXLEN = "", XMLITEMNAME = "MortgageType", XMLNAME = "MtgeTypeList", XMLPROJECTION = "COLLECTION");

/// List up to 5 additional mortgage characterisitics, if applicable. Where more than one code applies, report them all.
Property MtgeCharsList As list Of %String(MAXLEN = "", XMLITEMNAME = "MtgeChar", XMLNAME = "MtgeCharsList", XMLPROJECTION = "COLLECTION");

Property PropertyPostCode As FCA.PSD001.cmn.PostCodeType(XMLNAME = "PropertyPostCode") [ Required ];

Property TypeBorrower As %String(MAXLEN = "", VALUELIST = ",F,M,R,C,O,N", XMLNAME = "TypeBorrower") [ Required ];

Property RepayMethod As %String(MAXLEN = "", VALUELIST = ",C,E,I,P,U,M,N", XMLNAME = "RepayMethod") [ Required ];

/// Report term in years if mortgage was sold pre 2015 and in months if >= 2015 .
Property MtgeTerm As %xsd.positiveInteger(XMLNAME = "MtgeTerm", XMLTotalDigits = 3);

Property LoanAmt As FCA.PSD001.NonNegativeMonetaryType(XMLNAME = "LoanAmt") [ Required ];

Property PropertyValue As FCA.PSD001.NonNegativeMonetaryType(XMLNAME = "PropertyValue") [ Required ];

Property IncomeBasis As %String(MAXLEN = "", VALUELIST = ",S,J", XMLNAME = "IncomeBasis");

Property MainDOB As %Date(XMLNAME = "MainDOB") [ Required ];

/// Purpose of remortgage, only report if mortgage was sold pre 2015 otherwise do not provide this field.
Property RemtgePurpose As FCA.PSD001.RemortgagePurposeType(XMLNAME = "RemtgePurpose");

Property MainEmpStatus As %String(MAXLEN = "", VALUELIST = ",E,S,R,O", XMLNAME = "MainEmpStatus");

Property GrossIncome As FCA.PSD001.NonNegativeMonetaryType(XMLNAME = "GrossIncome");

Property IncomeVerification As %String(MAXLEN = "", VALUELIST = ",Y,N,O", XMLNAME = "IncomeVerification");

Property MainBorrowerCCJValue As %xsd.nonNegativeInteger(XMLNAME = "MainBorrowerCCJValue");

Property SecondBorrowerCCJValue As %xsd.nonNegativeInteger(XMLNAME = "SecondBorrowerCCJValue");

/// List up to 4 additional mortgage characterisitics, if applicable. Where more than one code applies, report them all.
Property MainBorrowerImpCredHistList As list Of %String(MAXLEN = "", XMLITEMNAME = "MainBorrowerImpCredHist", XMLNAME = "MainBorrowerImpCredHistList", XMLPROJECTION = "COLLECTION");

/// List up to 4 additional mortgage characterisitics, if applicable. Where more than one code applies, report them all.
Property SecondBorrowerImpCredHistList As list Of %String(MAXLEN = "", XMLITEMNAME = "SecondBorrowerImpCredHist", XMLNAME = "SecondBorrowerImpCredHistList", XMLPROJECTION = "COLLECTION");

Property InitialGrossIntRate As %Numeric(XMLNAME = "InitialGrossIntRate");

Property DateIncentiveRateEnds As %Date(XMLNAME = "DateIncentiveRateEnds");

Property DateERCEnds As %Date(XMLNAME = "DateERCEnds");

Property PurchasePrice As FCA.PSD001.NonNegativeMonetaryType(XMLNAME = "PurchasePrice");

Property TypeDwelling As %String(MAXLEN = "", VALUELIST = ",B,D,S,T,F,P,O", XMLNAME = "TypeDwelling");

Property NumHabitableRooms As %xsd.nonNegativeInteger(XMLNAME = "NumHabitableRooms");

Property NumBedrooms As %xsd.nonNegativeInteger(XMLNAME = "NumBedrooms");

/// List up to 3 additional mortgage characterisitics, if applicable and mortgage was sold post 2015. Where more than one code applies, report them all.
Property RemtgePurposeList As list Of %String(MAXLEN = "", XMLITEMNAME = "RemtgePurpose", XMLNAME = "RemtgePurposeList", XMLPROJECTION = "COLLECTION");

Property HowSaleMade As %String(MAXLEN = "", VALUELIST = ",F,T,E,P,O,I", XMLNAME = "HowSaleMade");

Property TypeReversionRate As %String(MAXLEN = "", VALUELIST = ",01,02,04,05,06,07,08,98,99", XMLNAME = "TypeReversionRate");

Property GovernmentInitiative As FCA.PSD001.YesNoType(XMLNAME = "GovernmentInitiative");

/// List up to 11 if applicable. Where more than one code applies, report them all.
Property RepaymentStrategyList As list Of %String(MAXLEN = "", XMLITEMNAME = "RepaymentStrategy", XMLNAME = "RepaymentStrategyList", XMLPROJECTION = "COLLECTION");

Property PercentageIO As FCA.PSD001.PercentDP0Type(XMLNAME = "PercentageIO");

Property InterestRollUp As FCA.PSD001.YesNoType(XMLNAME = "InterestRollUp");

Property ValuationType As %String(MAXLEN = "", VALUELIST = ",I,E,A,O", XMLNAME = "ValuationType");

Property SecondDOB As %Date(XMLNAME = "SecondDOB");

Property MoneyWithdrawn As FCA.PSD001.NonNegativeMonetaryType(XMLNAME = "MoneyWithdrawn");

Property AmountDebtCons As FCA.PSD001.NonNegativeMonetaryType(XMLNAME = "AmountDebtCons");

Property EarlyRepaymentCharge As FCA.PSD001.YesNoType(XMLNAME = "EarlyRepaymentCharge");

Property NewDwelling As FCA.PSD001.cmn.YNType(XMLNAME = "NewDwelling");

Property GarageInc As FCA.PSD001.cmn.YNType(XMLNAME = "GarageInc");

Property MtgeProtectionPlanInc As FCA.PSD001.cmn.YNType(XMLNAME = "MtgeProtectionPlanInc");

Property Currency As %String(MAXLEN = "", VALUELIST = ",GBP,EUR,USD,JPY,OTH", XMLNAME = "Currency");

Property CustomersShare As FCA.PSD001.PercentDP0Type(XMLNAME = "CustomersShare");

Property TotalLoanAvailable As FCA.PSD001.NonNegativeMonetaryType(XMLNAME = "TotalLoanAvailable");

Property LenderFees As FCA.PSD001.NonNegativeMonetaryType(XMLNAME = "LenderFees");

Property IntermediaryFees As FCA.PSD001.NonNegativeMonetaryType(XMLNAME = "IntermediaryFees");

Property FeesChargesAdded As FCA.PSD001.NonNegativeMonetaryType(XMLNAME = "FeesChargesAdded");

Property ProcurationFee As FCA.PSD001.NonNegativeMonetaryType(XMLNAME = "ProcurationFee");

Property NumberAssessed As %String(MAXLEN = "", VALUELIST = ",1,2,3", XMLNAME = "NumberAssessed");

Property DependentAdults As %xsd.nonNegativeInteger(XMLNAME = "DependentAdults");

Property DependentChildren As %xsd.nonNegativeInteger(XMLNAME = "DependentChildren");

Property SecondEmpStatus As %String(MAXLEN = "", VALUELIST = ",E,S,R,O", XMLNAME = "SecondEmpStatus");

Property MainRetirementAge As %xsd.nonNegativeInteger(XMLNAME = "MainRetirementAge");

Property SecondRetirementAge As %xsd.nonNegativeInteger(XMLNAME = "SecondRetirementAge");

Property MainGrossBasicPay As %xsd.nonNegativeInteger(XMLNAME = "MainGrossBasicPay");

Property MainGrossOtherIncomeEmployment As %xsd.nonNegativeInteger(XMLNAME = "MainGrossOtherIncomeEmployment");

Property MainGrossIncomeSelfEmployment As %xsd.nonNegativeInteger(XMLNAME = "MainGrossIncomeSelfEmployment");

Property MainGrossOtherIncome As %xsd.nonNegativeInteger(XMLNAME = "MainGrossOtherIncome");

Property SecondGrossBasicPay As %xsd.nonNegativeInteger(XMLNAME = "SecondGrossBasicPay");

Property SecondGrossOtherIncomeEmployment As %xsd.nonNegativeInteger(XMLNAME = "SecondGrossOtherIncomeEmployment");

Property SecondGrossIncomeSelfEmployment As %xsd.nonNegativeInteger(XMLNAME = "SecondGrossIncomeSelfEmployment");

Property SecondGrossOtherIncome As %xsd.nonNegativeInteger(XMLNAME = "SecondGrossOtherIncome");

Property ThirdGrossBasicPay As %xsd.nonNegativeInteger(XMLNAME = "ThirdGrossBasicPay");

Property ThirdGrossOtherIncomeEmployment As %xsd.nonNegativeInteger(XMLNAME = "ThirdGrossOtherIncomeEmployment");

Property ThirdGrossIncomeSelfEmployment As %xsd.nonNegativeInteger(XMLNAME = "ThirdGrossIncomeSelfEmployment");

Property ThirdGrossOtherIncome As %xsd.nonNegativeInteger(XMLNAME = "ThirdGrossOtherIncome");

Property MainTotalVerifiedNetIncome As %xsd.nonNegativeInteger(XMLNAME = "MainTotalVerifiedNetIncome");

Property SecondTotalVerifiedNetIncome As %xsd.nonNegativeInteger(XMLNAME = "SecondTotalVerifiedNetIncome");

Property ThirdTotalVerifiedNetIncome As %xsd.nonNegativeInteger(XMLNAME = "ThirdTotalVerifiedNetIncome");

Property TotalOutstandingCredits As %xsd.nonNegativeInteger(XMLNAME = "TotalOutstandingCredits");

Property MonthlyExpenditure As %xsd.nonNegativeInteger(XMLNAME = "MonthlyExpenditure");

Property BasicExpenditure As %xsd.nonNegativeInteger(XMLNAME = "BasicExpenditure");

Property StressTestedInterestRate As FCA.PSD001.PercentDP2Type(XMLNAME = "StressTestedInterestRate");

Property MCOBUsed As %String(MAXLEN = "", VALUELIST = ",Y,T,N", XMLNAME = "MCOBUsed");

Storage Default
{
<Data name="MortgageDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PrincipalOrNetworkFSARef</Value>
</Value>
<Value name="3">
<Value>AcctOpenDate</Value>
</Value>
<Value name="4">
<Value>AdvisedSale</Value>
</Value>
<Value name="5">
<Value>TypeIntRate</Value>
</Value>
<Value name="6">
<Value>MtgeTypeList</Value>
</Value>
<Value name="7">
<Value>MtgeCharsList</Value>
</Value>
<Value name="8">
<Value>PropertyPostCode</Value>
</Value>
<Value name="9">
<Value>TypeBorrower</Value>
</Value>
<Value name="10">
<Value>RepayMethod</Value>
</Value>
<Value name="11">
<Value>MtgeTerm</Value>
</Value>
<Value name="12">
<Value>LoanAmt</Value>
</Value>
<Value name="13">
<Value>PropertyValue</Value>
</Value>
<Value name="14">
<Value>IncomeBasis</Value>
</Value>
<Value name="15">
<Value>MainDOB</Value>
</Value>
<Value name="16">
<Value>RemtgePurpose</Value>
</Value>
<Value name="17">
<Value>MainEmpStatus</Value>
</Value>
<Value name="18">
<Value>GrossIncome</Value>
</Value>
<Value name="19">
<Value>IncomeVerification</Value>
</Value>
<Value name="20">
<Value>MainBorrowerCCJValue</Value>
</Value>
<Value name="21">
<Value>SecondBorrowerCCJValue</Value>
</Value>
<Value name="22">
<Value>MainBorrowerImpCredHistList</Value>
</Value>
<Value name="23">
<Value>SecondBorrowerImpCredHistList</Value>
</Value>
<Value name="24">
<Value>InitialGrossIntRate</Value>
</Value>
<Value name="25">
<Value>DateIncentiveRateEnds</Value>
</Value>
<Value name="26">
<Value>DateERCEnds</Value>
</Value>
<Value name="27">
<Value>PurchasePrice</Value>
</Value>
<Value name="28">
<Value>TypeDwelling</Value>
</Value>
<Value name="29">
<Value>NumHabitableRooms</Value>
</Value>
<Value name="30">
<Value>NumBedrooms</Value>
</Value>
<Value name="31">
<Value>RemtgePurposeList</Value>
</Value>
<Value name="32">
<Value>HowSaleMade</Value>
</Value>
<Value name="33">
<Value>TypeReversionRate</Value>
</Value>
<Value name="34">
<Value>GovernmentInitiative</Value>
</Value>
<Value name="35">
<Value>RepaymentStrategyList</Value>
</Value>
<Value name="36">
<Value>PercentageIO</Value>
</Value>
<Value name="37">
<Value>InterestRollUp</Value>
</Value>
<Value name="38">
<Value>ValuationType</Value>
</Value>
<Value name="39">
<Value>SecondDOB</Value>
</Value>
<Value name="40">
<Value>MoneyWithdrawn</Value>
</Value>
<Value name="41">
<Value>AmountDebtCons</Value>
</Value>
<Value name="42">
<Value>EarlyRepaymentCharge</Value>
</Value>
<Value name="43">
<Value>NewDwelling</Value>
</Value>
<Value name="44">
<Value>GarageInc</Value>
</Value>
<Value name="45">
<Value>MtgeProtectionPlanInc</Value>
</Value>
<Value name="46">
<Value>Currency</Value>
</Value>
<Value name="47">
<Value>CustomersShare</Value>
</Value>
<Value name="48">
<Value>TotalLoanAvailable</Value>
</Value>
<Value name="49">
<Value>LenderFees</Value>
</Value>
<Value name="50">
<Value>IntermediaryFees</Value>
</Value>
<Value name="51">
<Value>FeesChargesAdded</Value>
</Value>
<Value name="52">
<Value>ProcurationFee</Value>
</Value>
<Value name="53">
<Value>NumberAssessed</Value>
</Value>
<Value name="54">
<Value>DependentAdults</Value>
</Value>
<Value name="55">
<Value>DependentChildren</Value>
</Value>
<Value name="56">
<Value>SecondEmpStatus</Value>
</Value>
<Value name="57">
<Value>MainRetirementAge</Value>
</Value>
<Value name="58">
<Value>SecondRetirementAge</Value>
</Value>
<Value name="59">
<Value>MainGrossBasicPay</Value>
</Value>
<Value name="60">
<Value>MainGrossOtherIncomeEmployment</Value>
</Value>
<Value name="61">
<Value>MainGrossIncomeSelfEmployment</Value>
</Value>
<Value name="62">
<Value>MainGrossOtherIncome</Value>
</Value>
<Value name="63">
<Value>SecondGrossBasicPay</Value>
</Value>
<Value name="64">
<Value>SecondGrossOtherIncomeEmployment</Value>
</Value>
<Value name="65">
<Value>SecondGrossIncomeSelfEmployment</Value>
</Value>
<Value name="66">
<Value>SecondGrossOtherIncome</Value>
</Value>
<Value name="67">
<Value>ThirdGrossBasicPay</Value>
</Value>
<Value name="68">
<Value>ThirdGrossOtherIncomeEmployment</Value>
</Value>
<Value name="69">
<Value>ThirdGrossIncomeSelfEmployment</Value>
</Value>
<Value name="70">
<Value>ThirdGrossOtherIncome</Value>
</Value>
<Value name="71">
<Value>MainTotalVerifiedNetIncome</Value>
</Value>
<Value name="72">
<Value>SecondTotalVerifiedNetIncome</Value>
</Value>
<Value name="73">
<Value>ThirdTotalVerifiedNetIncome</Value>
</Value>
<Value name="74">
<Value>TotalOutstandingCredits</Value>
</Value>
<Value name="75">
<Value>MonthlyExpenditure</Value>
</Value>
<Value name="76">
<Value>BasicExpenditure</Value>
</Value>
<Value name="77">
<Value>StressTestedInterestRate</Value>
</Value>
<Value name="78">
<Value>MCOBUsed</Value>
</Value>
</Data>
<DataLocation>^FCA.PSD001.MortgageD</DataLocation>
<DefaultData>MortgageDefaultData</DefaultData>
<IdLocation>^FCA.PSD001.MortgageD</IdLocation>
<IndexLocation>^FCA.PSD001.MortgageI</IndexLocation>
<StreamLocation>^FCA.PSD001.MortgageS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
