start & finish
verifyState: evt 
	"We are sure we will make a mark now. Make sure the palette has not
	changed state while we were away. If so, end this action and start
	another one. 6/11/97 19:52 tk action, currentColor, brush"
	"Install the brush, color, (replace mode), and cursor."
	| _gsSqueakTemp_myAction |
	palette isInWorld
		ifFalse: [self world addMorphFront: palette].
	"It happens. might want to position it also"
	_gsSqueakTemp_myAction := self getActionFor: evt.
	(self get: #changed for: evt)
			== false
		ifFalse: [self
				set: #changed
				for: evt
				to: false.
			self invalidRect: rotationButton bounds.
			"snap these back"
			rotationButton position: bounds topCenter - (6 @ 0).
			"later adjust by button width?"
			self invalidRect: rotationButton bounds.
			self invalidRect: scaleButton bounds.
			scaleButton position: bounds rightCenter - (scaleButton width @ 6).
			self invalidRect: scaleButton bounds.
			_gsSqueakTemp_myAction == #polygon:
				ifFalse: [self polyFreeze].
			"end polygon mode"
			^ self
				set: #action
				for: evt
				to: (self prepareToPaint: evt)]