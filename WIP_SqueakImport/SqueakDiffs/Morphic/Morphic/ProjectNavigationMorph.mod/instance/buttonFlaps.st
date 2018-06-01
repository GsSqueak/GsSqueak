the buttons
buttonFlaps

	^self inFlapsSuppressedMode ifTrue: [
		self makeButton: 'Show tabs' translated balloonText: 'Show tabs' translated for: #toggleFlapsSuppressed
	] ifFalse: [
		self makeButton: 'Hide tabs' translated balloonText: 'Hide tabs' translated for: #toggleFlapsSuppressed
	].

