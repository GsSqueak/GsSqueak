event handling
mouseMove: evt
	actWhen == #buttonDown ifTrue: [^ self].
	(self containsPoint: evt cursorPoint)
		ifTrue:[self color: (oldColor alphaMixed: 1/2 with: Color white)]
		ifFalse: [self color: oldColor].
