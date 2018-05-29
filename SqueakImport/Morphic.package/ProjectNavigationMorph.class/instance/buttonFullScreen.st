the buttons
buttonFullScreen

	^self inFullScreenMode ifTrue: [
		self makeButton: 'Browser Reentry' translated balloonText: 'Re-enter the browser' translated for: #fullScreenOff
	] ifFalse: [
		self makeButton: 'Escape Browser' translated balloonText: 'Use the full screen' translated for: #fullScreenOn
	]

