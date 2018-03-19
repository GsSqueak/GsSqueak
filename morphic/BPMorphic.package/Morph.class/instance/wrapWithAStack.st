-Etoys-card in a stack
wrapWithAStack
	"Install me as a card inside a new stack. The stack has no border or
	controls, so I my look is unchanged. If I don't already have a
	CardPlayer, find my data fields and make one. Be ready to make new
	cards in the stack that look like me, but hold different field data."
	self player class officialClass == CardPlayer
		ifFalse: [self abstractAModel
				ifFalse: [^ false]].
	StackMorph new initializeWith: self.
	self stack addHalo