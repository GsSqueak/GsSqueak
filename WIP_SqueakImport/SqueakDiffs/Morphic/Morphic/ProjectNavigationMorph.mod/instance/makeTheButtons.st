buttons
makeTheButtons
	^ Preferences showAdvancedNavigatorButtons
		ifTrue: [self makeTheAdvancedButtons]
		ifFalse: [self makeTheSimpleButtons]