event handling
mouseDown: evt
	| now dt |
	actWhen == #buttonDown
		ifTrue: [self doButtonAction].
	actWhen == #buttonUp
		ifTrue: [self state: #pressed].
	actWhen == #whilePressed
		ifTrue: 
			[self state: #pressed.
			now := Time millisecondClockValue.
			"Allow on:send:to: to set the response to events other than actWhen"
			dt := Time millisecondClockValue - now max: 0.  "Time it took to do"
			"NOTE: this delay is temporary disabled because it makes event reaction delay,
				e.g. the action is not stopped even if you release the button... - Takashi" 
			[dt < 200 ifTrue: [(Delay forMilliseconds: 200-dt) wait]].
			self mouseStillDown: evt].
	super mouseDown: evt