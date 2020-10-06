/// 
Class Custom.Normalization.Rule.Perf Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="MortgagePerformanceRules" context="Canonical.MortgagePerf" production="">
<ruleSet name="Mortgage Performance Validation Rules" effectiveBegin="" effectiveEnd="">
<return>1</return>
</ruleSet>
</ruleDefinition>
}

}
