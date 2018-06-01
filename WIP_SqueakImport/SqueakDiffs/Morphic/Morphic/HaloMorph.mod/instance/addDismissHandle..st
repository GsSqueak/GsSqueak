handles
addDismissHandle: handleSpec
	"Add the dismiss handle according to the spec, unless selectiveHalos is on and my target resists dismissal"

	| dismissHandle |
	(target okayToAddDismissHandle or: [Preferences selectiveHalos not]) ifTrue:
		[dismissHandle := self addHandle: handleSpec
			on: #mouseDown send: #mouseDownInDimissHandle:with: to: self.
		dismissHandle on: #mouseUp send: #maybeDismiss:with: to: self.
		dismissHandle on: #mouseDown send: #setDismissColor:with: to: self.
		dismissHandle on: #mouseMove send: #setDismissColor:with: to: self]
