event handling
handlesMouseDown: evt

	self inPartsBin ifTrue: [^ false].

	true ifTrue: [^ true].  "5/7/98 jhm temporary fix to allow use when rotated"

	(handleMorph fullContainsPoint: evt cursorPoint)
		ifTrue: [^ true]
		ifFalse: [^ super handlesMouseDown: evt].
