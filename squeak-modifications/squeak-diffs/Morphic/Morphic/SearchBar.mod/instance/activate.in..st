accessing
activate: event in: morph 
	self class useScratchPad
		ifTrue:
			[ event hand keyboardFocus = self scratchPad ifFalse: [ originatingWidget := event hand keyboardFocus ].
			self scratchPad selectAll; openInWorld.
			self layoutScratchPad.
			event hand newKeyboardFocus: self scratchPad ]
		ifFalse:
			[ self selection: (1 to: self searchTerm size).
			event hand newKeyboardFocus: morph textMorph ]