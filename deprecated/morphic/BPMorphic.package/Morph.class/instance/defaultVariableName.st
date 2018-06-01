-Etoys-support
defaultVariableName
	"If the receiver is of the sort that wants a variable maintained on its
	behalf in the 'card' data, then return a variable name to be used for
	that datum. What is returned here is only a point of departure in the
	forthcoming negotiation"
	^ Scanner
		wellFormedInstanceVariableNameFrom: (self
				valueOfProperty: #variableName
				ifAbsent: [self externalName])