private
penultimateLiteral: anObject
	"Set the penultimate literal of the receiver, which holds either the
	 receiver's selector or its properties (which will hold the selector).
	 If it is an AdditionalMethodState set the state's ownership to this
	 method"
	| pIndex |
	(pIndex := self numLiterals - 1) <= 0 ifTrue:
		[self error: 'insufficient literals'].
	self literalAt: pIndex put: anObject.
	anObject isMethodProperties ifTrue:
		[(anObject method ~~ nil
		  and: [anObject method ~~ self
		  and: [anObject method penultimateLiteral == anObject]]) ifTrue:
			[self error: 'a method''s AdditionalMethodState should not be shared'].
		 anObject setMethod: self.
		 anObject pragmas do: [:p| p setMethod: self]]