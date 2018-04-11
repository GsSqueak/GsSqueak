stepping and presenter
step
	timeout
		ifNil: [^ self].
	timeout = 0
		ifTrue: [self stopStepping.
			selectedButton performAction]
		ifFalse: [selectedButton
				label: ('{1} [{2}]' format: {selectedButton valueOfProperty: #normalLabel. timeout}).
			timeout := timeout - 1]