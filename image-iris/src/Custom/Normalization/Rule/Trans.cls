/// 
Class Custom.Normalization.Rule.Trans Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="MortgageTransactionRules" context="Canonical.Mortgage" production="">
<ruleSet name="Mortgage Transaction Validation Rules" effectiveBegin="" effectiveEnd="">
<rule name="Borrowed money can not be greater than property value" disabled="true">
<when condition="MoneyWithdrawn&gt;=PropertyValue">
<return>"Can not lend more money than property value"</return>
</when>
</rule>
<rule name="Property value must be greater than zero" disabled="false">
<when condition="PropertyValue&lt;=0">
<return>"Property value must be greater than zero"</return>
</when>
</rule>
<rule name="Legal purchase price must be greater than zero" disabled="false">
<when condition="PurchasePrice&lt;=0">
<return>"Legal purchase price must be greater than zero"</return>
</when>
</rule>
<rule name="Loan Amount must be greater than zero" disabled="false">
<when condition="LoanAmt&lt;=0">
<return>"Loan amount must be greater than zero"</return>
</when>
</rule>
<rule name="Loans must be given to adults" disabled="false">
<when condition="((Today()-PrimaryDateOfBirth)&lt;18)&amp;&amp;((Today()-SecondaryDateOfBirth)&lt;18)">
<return>"Mortgages can only be sold to adults."</return>
</when>
</rule>
<return>1</return>
</ruleSet>
</ruleDefinition>
}

}
