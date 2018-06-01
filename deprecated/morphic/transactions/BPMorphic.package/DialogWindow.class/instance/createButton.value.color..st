constructing
createButton: buttonLabel value: buttonValue color: buttonColor 
	| _gsSqueakTemp_button |
	_gsSqueakTemp_button := PluggableButtonMorphPlus new label: buttonLabel;
				
				action: [self closeDialog: buttonValue];
				 setProperty: #normalColor toValue: buttonColor;
				 setProperty: #normalLabel toValue: buttonLabel;
				 hResizing: #rigid;
				 vResizing: #rigid;
				 yourself.
	self deselectButton: _gsSqueakTemp_button.
	buttonRow addMorphBack: _gsSqueakTemp_button.
	self updateButtonExtent.
	^ _gsSqueakTemp_button