as yet unclassified
bindVariableUsesIn: aDictionary

	^ (aDictionary at: name ifAbsent: [^ self]) copyTree