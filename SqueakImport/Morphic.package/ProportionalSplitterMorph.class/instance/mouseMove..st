events
mouseMove: anEvent 
	anEvent hand temporaryCursor
		ifNil: [^ self].
	self class fastSplitterResize
		ifFalse:  [self updateFromEvent: anEvent]
		ifTrue: [traceMorph
				ifNil: [traceMorph := Morph newBounds: self bounds.
					traceMorph color: (Color gray alpha: 0.5).
					traceMorph borderWidth: 0.
					self owner addMorph: traceMorph].
			splitsTopAndBottom
				ifTrue: [traceMorph position: traceMorph position x @ (self normalizedY: anEvent cursorPoint y)]
				ifFalse: [traceMorph position: (self normalizedX: anEvent cursorPoint x) @ traceMorph position y]]