handles
addDismissHandle: handleSpec 
	"Add the dismiss handle according to the spec, unless selectiveHalos is
	on and my target resists dismissal"
	| _gsSqueakTemp_dismissHandle |
	(target okayToAddDismissHandle
			or: [Preferences selectiveHalos not])
		ifTrue: [_gsSqueakTemp_dismissHandle := self
						addHandle: handleSpec
						on: #mouseDown
						send: #mouseDownInDimissHandle:with:
						to: self.
			_gsSqueakTemp_dismissHandle
				on: #mouseUp
				send: #maybeDismiss:with:
				to: self.
			_gsSqueakTemp_dismissHandle
				on: #mouseDown
				send: #setDismissColor:with:
				to: self.
			_gsSqueakTemp_dismissHandle
				on: #mouseMove
				send: #setDismissColor:with:
				to: self]