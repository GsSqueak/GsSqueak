events
tabSelected
	"The user clicked on the tab. Show or hide the flap. Try to be a little
	smart about a click on a tab whose flap is open but only just barely."
	dragged == true
		ifTrue: [^ dragged := false].
	self flapShowing
		ifTrue: [self referentThickness < 23
				ifTrue: ["an attractive number"
					self openFully]
				ifFalse: [self hideFlap]]
		ifFalse: [self showFlap]