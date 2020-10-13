/// 
Class Custom.Normalization.Rule.Afford Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="MortgageAffordabilityRules" context="Canonical.MortgageAfford" production="">
<ruleSet name="Mortgage Affordability Validation Rules" effectiveBegin="" effectiveEnd="">
<return>1</return>
</ruleSet>
</ruleDefinition>
}

}
