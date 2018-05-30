pointer-list
inspectObject
	pointerListIndex = 0 ifTrue: [^ Beeper beep].
	(objectList at: pointerListIndex) inspect