event handling
mouseDown: evt 
	| _gsSqueakTemp_now _gsSqueakTemp_dt |
	self state: #pressed.
	actWhen == #buttonDown
		ifTrue: [self doButtonAction]
		ifFalse: [_gsSqueakTemp_now := Time millisecondClockValue.
			super mouseDown: evt.
			"Allow on:send:to: to set the response to events other
			than actWhen"
			_gsSqueakTemp_dt := Time millisecondClockValue - _gsSqueakTemp_now max: 0.
			"Time it took to do"
			_gsSqueakTemp_dt < 200
				ifTrue: [(Delay forMilliseconds: 200 - _gsSqueakTemp_dt) wait]].
	self mouseStillDown: evt