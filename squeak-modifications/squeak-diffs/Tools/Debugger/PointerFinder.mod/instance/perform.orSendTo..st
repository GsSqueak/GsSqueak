message handling
perform: selector orSendTo: otherTarget
	selector == #inspectObject ifTrue: [^ self inspectObject].
	selector == #searchAgain ifTrue: [^ self searchAgain].
	^ super perform: selector orSendTo: otherTarget