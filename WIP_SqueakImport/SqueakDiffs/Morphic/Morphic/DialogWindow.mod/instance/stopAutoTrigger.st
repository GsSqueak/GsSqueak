stepping and presenter
stopAutoTrigger
	timeout ifNil: [^self].
	timeout := nil.
	self stopStepping.
	selectedButton label: (selectedButton valueOfProperty: #normalLabel). 