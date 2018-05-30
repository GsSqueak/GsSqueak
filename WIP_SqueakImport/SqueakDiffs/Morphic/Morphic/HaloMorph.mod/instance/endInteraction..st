private
endInteraction: event
	"Clean up after a user interaction with the a halo control"

	| m |
	self isMagicHalo: false.	"no longer"
	self magicAlpha: 1.0.
	(target isInWorld not or: [owner isNil]) ifTrue: [^self].
	[target isFlexMorph and: [target hasNoScaleOrRotation]] whileTrue: 
			[m := target firstSubmorph.
			target removeFlexShell.
			target := m].
	self isInWorld 
		ifTrue: 
			["make sure handles show in front, even if flex shell added"
			self flag: #tofix. "mt: Try to avoid deleting and re-creating an event handler (here: the handle) while handling the event."
			self comeToFront.
			self addHandles.
			event hand newMouseFocus: self].
	(self valueOfProperty: #commandInProgress) ifNotNil: 
			[:cmd | 
			self rememberCommand: cmd.
			self removeProperty: #commandInProgress].