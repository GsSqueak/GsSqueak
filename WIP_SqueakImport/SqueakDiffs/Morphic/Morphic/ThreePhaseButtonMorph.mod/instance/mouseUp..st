event handling
mouseUp: evt 
	"Allow on:send:to: to set the response to events other than actWhen"
	actWhen == #buttonDown
		ifTrue: [super mouseUp: evt].
	actWhen == #buttonUp
		ifTrue: [(self containsPoint: evt cursorPoint)
				ifTrue: [self state: #on.
					self doButtonAction: evt.
					super mouseUp: evt]
				ifFalse: [self state: #off.
					target
						ifNotNil: ["Allow owner to keep it selected for radio
							buttons"
							target mouseUpBalk: evt]]].
	actWhen == #whilePressed
		ifTrue: [self state: #off.
			super mouseUp: evt]