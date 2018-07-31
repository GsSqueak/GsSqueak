literals
sendsSelector: aSelector 
	| scanner |
	scanner := InstructionStream on: self.
	scanner scanFor: 
		[:x | 
		 scanner selectorToSendOrSelf == aSelector ifTrue:
			[^true].
		 false	"keep scanning"].
	^false
