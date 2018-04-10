submorphs-add/remove
actWhen: condition 
	"Accepts symbols: #buttonDown, #buttonUp, and #whilePressed,
	#startDrag "
	actWhen := condition.
	actWhen == #startDrag
		ifTrue: [self
				on: #startDrag
				send: #doButtonAction
				to: self]
		ifFalse: [self
				on: #startDrag
				send: nil
				to: nil]