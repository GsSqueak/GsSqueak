*Tools-Browser-accessors
createInstVarAccessors
	"Create getters and setters for all inst vars defined here,
	 except do NOT clobber or override any selectors already understood by me"

	self instVarNames
		collect: [:each | each asSymbol]
		thenDo: [:instVar |
			(self canUnderstand: instVar) ifFalse: [self createGetterFor: instVar].
			(self canUnderstand: instVar asMutator) ifFalse: [self createSetterFor: instVar]].

