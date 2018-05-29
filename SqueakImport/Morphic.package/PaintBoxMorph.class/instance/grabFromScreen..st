actions
grabFromScreen: evt 
	"Allow the user to grab a picture from the screen OUTSIDE THE PAINTING AREA and install it in a blank stamp.  To get a stamp in the painting area, click on the stamp tool in a blank stamp."

	"scroll to blank stamp"

	| stampButton form |
	stampButton := stampHolder stampButtons first.
	[(stampHolder stampFormFor: stampButton) isNil] 
		whileFalse: [stampHolder scroll: 1].
	form := Form fromUser.
	tool state: #off.
	tool := stampHolder otherButtonFor: stampButton.
	stampHolder stampForm: form for: tool.	"install it"
	stampButton state: #on.
	stampButton doButtonAction: evt.
	evt hand showTemporaryCursor: (focusMorph getCursorFor: evt)