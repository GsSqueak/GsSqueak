events
mouseDown: anEvent 
	"If the user manually drags me, don't override him with auto positioning."

	anEvent redButtonChanged
		ifTrue: [ self withSiblingSplittersDo: [ : each | each stopStepping ] ]
		ifFalse:
			[ anEvent shiftPressed
				ifTrue: [ self startStepping ]
				ifFalse:
					[ self startStepping.
					self withSiblingSplittersDo: [ : each | each startStepping ] ] ].
	(self class showSplitterHandles not and: [ self bounds containsPoint: anEvent cursorPoint ]) ifTrue:
		[ oldColor := self color.
		self color: Color black ].
	^ super mouseDown: anEvent