running
getUserResponse

	| hand world |
	(ProvideAnswerNotification signal: self message asString) 
		ifNotNil: [:answer| 
			^ answer = #default
				ifTrue: [result]
				ifFalse: [answer]].

	self message ifEmpty: [messageMorph delete]. "Do not waste space."
	self paneMorph submorphs ifEmpty: [self paneMorph delete]. "Do not waste space."
	
	hand := self currentHand.
	world := self currentWorld.

	self fullBounds.
	self center: preferredPosition.
	self bounds: (self bounds translatedToBeWithin: world bounds).
	self openInWorld: world.
	
	hand showTemporaryCursor: nil. "Since we are out of context, reset the cursor."
	
	hand keyboardFocus in: [:priorKeyboardFocus |
		self exclusive ifTrue: [hand newMouseFocus: self].
		hand newKeyboardFocus: self.

		[self isInWorld] whileTrue:[world doOneSubCycle].

		hand newKeyboardFocus: priorKeyboardFocus.
		hand releaseMouseFocus].

	^ result