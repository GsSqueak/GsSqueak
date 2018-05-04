as yet unclassified
bindVariablesIn: aDictionary 
	^ (aDictionary at: name ifAbsent: [^ self]) copyTree