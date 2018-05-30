constructing
createButton: buttonLabel value: buttonValue color: buttonColor

	| button |
	button := PluggableButtonMorphPlus new
		label: buttonLabel ;
		action: [ self closeDialog: buttonValue ] ;
		setProperty: #normalColor toValue: buttonColor ;
		setProperty: #normalLabel toValue: buttonLabel ;
		hResizing: #rigid;
		vResizing: #rigid;
		yourself.
	
	self deselectButton: button.
	buttonRow addMorphBack: button.
	self updateButtonExtent.
	
	^ button