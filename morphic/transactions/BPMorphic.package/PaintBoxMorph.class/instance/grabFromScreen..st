actions
grabFromScreen: evt 
	"Allow the user to grab a picture from the screen OUTSIDE THE
	PAINTING AREA and install it in a blank stamp. To get a stamp in the
	painting area, click on the stamp tool in a blank stamp."
	"scroll to blank stamp"
	| _gsSqueakTemp_stampButton _gsSqueakTemp_form |
	_gsSqueakTemp_stampButton := stampHolder stampButtons first.
	[(stampHolder stampFormFor: _gsSqueakTemp_stampButton) isNil]
		whileFalse: [stampHolder scroll: 1].
	_gsSqueakTemp_form := Form fromUser.
	tool state: #off.
	tool := stampHolder otherButtonFor: _gsSqueakTemp_stampButton.
	stampHolder stampForm: _gsSqueakTemp_form for: tool.
	"install it"
	_gsSqueakTemp_stampButton state: #on.
	_gsSqueakTemp_stampButton doButtonAction: evt.
	evt hand
		showTemporaryCursor: (focusMorph getCursorFor: evt)