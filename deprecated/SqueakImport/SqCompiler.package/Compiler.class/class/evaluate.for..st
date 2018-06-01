evaluating
evaluate: textOrString for: anObject  
	"See Compiler|evaluate:for:notifying:. If a compilation error occurs, 
	a Syntax Error view is created rather than notifying any requestor."

	^self evaluate: textOrString for: anObject notifying: nil