query
allCallsOn: aLiteral 
	"Answer a sorted collection of all the methods that call on aLiteral even deeply embedded in literal array."
	"self default browseAllCallsOn: #open:label:."
	
	^self
		allCallsOn: aLiteral
		fromBehaviors: self allBehaviors
		sorted: true