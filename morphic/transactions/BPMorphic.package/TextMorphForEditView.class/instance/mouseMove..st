event handling
mouseMove: evt 
	| _gsSqueakTemp_editEvt |
	super mouseMove: evt.
	evt redButtonPressed
		ifFalse: [^ self].
	_gsSqueakTemp_editEvt := evt transformedBy: (self transformedFrom: editView) inverseTransformation.
	(_gsSqueakTemp_editEvt position y between: editView top and: editView bottom)
		ifTrue: [self stopSteppingSelector: #autoScrollView:]
		ifFalse: ["Start auto-scrolling"
			self
				startStepping: #autoScrollView:
				at: Time millisecondClockValue
				arguments: (Array with: _gsSqueakTemp_editEvt)
				stepTime: 100]