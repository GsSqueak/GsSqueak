event handling
mouseUp: evt 
	self updateFillStyle: evt.
	allButtons
		ifNil: [^ self].
	allButtons
		do: [:m | (m containsPoint: evt cursorPoint)
				ifTrue: [m performAction]].
	allButtons := nil.
	self changed